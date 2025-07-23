import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserReportsScreen extends StatefulWidget {
  const UserReportsScreen({super.key});

  @override
  State<UserReportsScreen> createState() => _UserReportsScreenState();
}

class _UserReportsScreenState extends State<UserReportsScreen> {
  List<dynamic> reports = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchReports();
  }

  Future<void> _fetchReports() async {
    try {
      final response = await Supabase.instance.client
          .from('blog_reports')
          .select('*')
          .order('created_at', ascending: false);

      setState(() {
        reports = response;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching reports: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('User Reports')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : reports.isEmpty
          ? const Center(child: Text('No reports found.'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                'Reason: ${report['reason']}',
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Text(
                'Reported by: ${report['userid']}\nOn: ${report['created_at']}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _deleteReport(report['id']);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteReport(String reportId) async {
    await Supabase.instance.client
        .from('blog_reports')
        .delete()
        .eq('id', reportId);
    _fetchReports(); // refresh after delete
  }
}
