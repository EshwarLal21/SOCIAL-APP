import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/features/blogs/blogs_bloc.dart';
import 'package:torogi/features/blogs/blogs_event.dart';
import 'package:torogi/features/blogs/blogs_state.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

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

  // Updated categories list to match database constraints
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

      print('Current user ID: ${currentUser.id}'); // Debug log
      
      // Upload image to storage
      final imageExt = _selectedImage!.path.split('.').last.toLowerCase();
      final imagePath = '${DateTime.now().toIso8601String()}.$imageExt';
      
      // Read file as bytes to ensure proper upload
      final bytes = await _selectedImage!.readAsBytes();
      
      // Upload to storage bucket
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

      // Create the blog post with exact schema match
      final blogData = {
        'userid': currentUser.id,
        'title': _titleController.text.trim(),
        'description': _contentController.text.trim(),
        'location': _locationController.text.trim(),
        'image': imageUrl,
        'category': _selectedCategory,
        'blograting': 0,
        'createdat': DateTime.now().toIso8601String(),
      };

      print('Inserting blog data: $blogData'); // Debug log

      final response = await supabase
          .from('blogs')
          .insert(blogData)
          .select();

      print('Insert response: $response'); // Debug log

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Blog posted successfully!')),
        );
      }
    } catch (e) {
      print('Error details: $e'); // Debug log
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating blog: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
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
          title: const Text('Create Blog'),
          actions: [
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.check),
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