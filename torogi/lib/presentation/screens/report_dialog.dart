import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:torogi/core/utils/snackbar_util.dart';

class ReportDialog extends StatefulWidget {
  final String blogId;

  const ReportDialog({super.key, required this.blogId});

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  final TextEditingController _reasonController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    final reason = _reasonController.text.trim();
    if (reason.isEmpty) {
      showSnackBar(context, 'Please provide a reason for the report.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) {
        showSnackBar(context, 'Please login to report this post.');
        return;
      }

      final authRepository = AuthRepository();
      await authRepository.reportBlog(
        blogId: widget.blogId,
        userId: userId,
        reason: reason,
      );

      if (mounted) {
        showSnackBar(context, 'Report submitted successfully.');
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, 'Error submitting report: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Report Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Please provide a reason for reporting this post:'),
          const SizedBox(height: 10),
          TextField(
            controller: _reasonController,
            decoration: const InputDecoration(
              hintText: 'Enter reason',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submitReport,
          child: _isSubmitting
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          )
              : const Text('Submit'),
        ),
      ],
    );
  }
}