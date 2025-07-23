import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:torogi/core/utils/snackbar_util.dart';
import 'package:torogi/features/profile/profile_bloc.dart';
import 'package:torogi/features/profile/profile_event.dart';
import 'package:torogi/features/profile/profile_state.dart';

class UpgradeRequestScreen extends StatefulWidget {
  final String initialUserType;

  const UpgradeRequestScreen({super.key, required this.initialUserType});

  @override
  State<UpgradeRequestScreen> createState() => _UpgradeRequestScreenState();
}

class _UpgradeRequestScreenState extends State<UpgradeRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedUserType;
  List<PlatformFile> _selectedFiles = [];
  final TextEditingController _businessIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedUserType = widget.initialUserType;
    context.read<ProfileBloc>().stream.listen((state) {
      if (!mounted) return; // Prevent accessing context after disposal
      if (state is ProfileSuccess) {
        showSnackBar(context, state.message);
        Navigator.pop(context); // Return to previous screen after success
      } else if (state is ProfileError) {
        showSnackBar(context, state.message, isError: true);
      }
    });
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      for (var file in result.files) {
        if (file.path == null || !File(file.path!).existsSync()) {
          showSnackBar(context, 'Invalid file: ${file.name}', isError: true);
          return;
        }
        final extension = file.extension?.toLowerCase();
        if (extension == null || !['pdf', 'jpg', 'jpeg', 'png'].contains(extension)) {
          showSnackBar(context, 'Unsupported file type: ${file.name}', isError: true);
          return;
        }
      }
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  void _submitRequest() {
    debugPrint('Submit button pressed');
    final currentState = context.read<ProfileBloc>().state;
    if (currentState is ProfileError) {
      debugPrint('Cannot submit: Profile in error state: ${currentState.message}');
      showSnackBar(context, 'Cannot submit request: Profile not loaded. Please try again.', isError: true);
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId != null) {
        debugPrint('Retrying profile load for userId: $userId');
        context.read<ProfileBloc>().add(LoadProfile(userId));
      }
      return;
    }

    if (_formKey.currentState!.validate()) {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      final businessId = _businessIdController.text.trim();
      if (userId != null && businessId.isNotEmpty) {
        debugPrint('Submitting RequestUpgrade event: userId=$userId, businessId=$businessId, requestType=usertype, requestedValue=$_selectedUserType');
        context.read<ProfileBloc>().add(
          RequestUpgrade(
            userId: userId,
            requestType: 'usertype',
            requestedValue: _selectedUserType!,
            businessId: businessId,
            files: _selectedFiles,
          ),
        );
      } else {
        debugPrint('Validation failed: userId=$userId, businessId=$businessId');
        showSnackBar(
          context,
          userId == null ? 'User not authenticated' : 'Please provide a business ID',
          isError: true,
        );
      }
    } else {
      debugPrint('Form validation failed');
      showSnackBar(
        context,
        'Please fill all required fields',
        isError: true,
      );
    }
  }

  @override
  void dispose() {
    _businessIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request User Type Upgrade',
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Desired User Type',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedUserType,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Employer',
                      child: Text('Employer'),
                    ),
                    DropdownMenuItem(
                      value: 'ServiceProvider',
                      child: Text('Service Provider'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedUserType = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a user type' : null,
                ),
                const SizedBox(height: 16),
                Text(
                  'Business ID',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _businessIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Enter Business ID',
                  ),
                  validator: (value) =>
                  value == null || value.trim().isEmpty ? 'Please enter a business ID' : null,
                ),
                const SizedBox(height: 16),
                Text(
                  'Upload Supporting Documents',
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _pickFiles,
                  icon: Icon(Icons.upload_file, color: colorScheme.onPrimary),
                  label: Text(
                    'Pick Files',
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (_selectedFiles.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    children: _selectedFiles
                        .map(
                          (file) => Chip(
                        label: Text(file.name),
                        onDeleted: () {
                          setState(() {
                            _selectedFiles.remove(file);
                          });
                        },
                      ),
                    )
                        .toList(),
                  ),
                const SizedBox(height: 16),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: _submitRequest,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Submit Upgrade Request'),
                    );
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