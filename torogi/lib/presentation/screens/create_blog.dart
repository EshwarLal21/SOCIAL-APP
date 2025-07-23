import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/features/blogs/blogs_bloc.dart';
import 'package:torogi/features/blogs/blogs_event.dart';
import 'package:torogi/features/blogs/blogs_state.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import '../../data/local/database/app_database.dart';

class CreateBlogScreen extends StatefulWidget {
  final AppDatabase database; // Add database as a parameter

  const CreateBlogScreen({super.key, required this.database});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  File? _selectedImage;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory = 'tech';

  static const List<Map<String, String>> _categories = [
    {'value': 'tech', 'display': 'Tech'},
    {'value': 'culture', 'display': 'Culture'},
    {'value': 'travel', 'display': 'Travel'},
    {'value': 'sports', 'display': 'Sports'},
    {'value': 'fashion', 'display': 'Fashion'},
    {'value': 'beauty', 'display': 'Beauty'},
    {'value': 'festivals', 'display': 'Festivals'},
    {'value': 'events', 'display': 'Events'},
    {'value': 'others', 'display': 'Others'},
  ];

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } on PlatformException catch (e) {
      String errorMessage = 'Failed to pick image';
      if (e.code == 'invalid_image') {
        errorMessage = 'The selected file is not a valid image';
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to pick image')),
        );
      }
    }
  }

  Future<void> _createBlog() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final supabase = Supabase.instance.client;

      // Check if user is authenticated
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      // Generate a unique ID for the blog
      final blogId = const Uuid().v4();

      // Prepare blog data for Drift
      final blogData = LocalBlogsCompanion(
        id: drift.Value(blogId),
        userId: drift.Value(currentUser.id),
        title: drift.Value(_titleController.text.trim()),
        description: drift.Value(_contentController.text.trim()),
        location: drift.Value(_locationController.text.trim().isEmpty
            ? null
            : _locationController.text.trim()),
        image: drift.Value(_selectedImage!.path), // Store local file path
        category: drift.Value(_selectedCategory),
        blogRating: const drift.Value(0.0),
        createdAt: drift.Value(DateTime.now()),
      );

      // Insert into Drift database
      await widget.database.into(widget.database.localBlogs).insert(blogData);

      print('Blog inserted into Drift: $blogData'); // Debug log

      // Optional: Sync with Supabase (e.g., if online)
      await _syncWithSupabase(blogId, currentUser.id);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Blog saved successfully!')),
        );
      }
    } catch (e) {
      print('Error details: $e'); // Debug log
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving blog: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _syncWithSupabase(String blogId, String userId) async {
    try {
      final supabase = Supabase.instance.client;

      // Upload image to Supabase storage
      final imageExt = _selectedImage!.path.split('.').last.toLowerCase();
      final imagePath = '$blogId.$imageExt';
      final bytes = await _selectedImage!.readAsBytes();

      final storageResponse = await supabase.storage.from('blogs').uploadBinary(
        imagePath,
        bytes,
        fileOptions: FileOptions(
          contentType: 'image/$imageExt',
          upsert: true,
        ),
      );

      print('Storage response: $storageResponse'); // Debug log

      // Get the public URL of the uploaded image
      final imageUrl = supabase.storage.from('blogs').getPublicUrl(imagePath);

      print('Image URL: $imageUrl'); // Debug log

      // Create the blog post in Supabase
      final blogData = {
        'id': blogId,
        'userid': userId,
        'title': _titleController.text.trim(),
        'description': _contentController.text.trim(),
        'location': _locationController.text.trim(),
        'image': imageUrl,
        'category': _selectedCategory,
        'blograting': 0,
        'createdat': DateTime.now().toIso8601String(),
      };

      print('Inserting blog data to Supabase: $blogData'); // Debug log

      final response = await supabase.from('blogs').insert(blogData).select();

      print('Insert response: $response'); // Debug log
    } catch (e) {
      print('Supabase sync error: $e'); // Debug log
      // Optionally, store the failed sync attempt in LocalChanges for later retry
      final changeData = LocalChangesCompanion(
        id: drift.Value(blogId),
        action: const drift.Value('insert'),
        payload: drift.Value(
          jsonEncode({
            'id': blogId,
            'userid': userId,
            'title': _titleController.text.trim(),
            'description': _contentController.text.trim(),
            'location': _locationController.text.trim(),
            'image_path': _selectedImage!.path, // Store local path for retry
            'category': _selectedCategory,
            'blograting': 0,
            'createdat': DateTime.now().toIso8601String(),
          }),
        ),
        createdAt: drift.Value(DateTime.now()),
      );

      await widget.database.into(widget.database.localChanges).insert(changeData);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogBloc, BlogState>(
      listener: (context, state) {
        if (state is BlogError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          title: const Text(
            'Create Blog',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(14),
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.check, color: Colors.white),
                tooltip: 'Publish Blog',
                onPressed: _createBlog,
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _selectedImage != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                        : const Center(
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category['value'],
                      child: Text(category['display']!),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedCategory = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 8,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter content';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}