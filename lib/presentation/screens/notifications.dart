import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> notifications = [];
  bool isLoading = true;

  RealtimeChannel? messageChannel;

  @override
  void initState() {
    super.initState();
    fetchNotifications();
    setupRealtimeMessageNotifications();
  }

  void setupRealtimeMessageNotifications() {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    messageChannel = supabase.channel('public:messages');

    messageChannel!
        .onPostgresChanges(
      event: PostgresChangeEvent.insert,
      schema: 'public',
      table: 'messages',
      callback: (payload) {
        final newMessage = payload.newRecord;
        if (newMessage['receiver_id'] == userId) {
          setState(() {
            notifications.insert(0, {
              'id': newMessage['id'],
              'message':
              "New message from ${newMessage['sender_id']}: ${newMessage['content']}",
              'createdat': newMessage['created_at'],
              'isread': false,
            });
          });
        }
      },
    ).subscribe();
  }

  Future<void> fetchNotifications() async {
    setState(() {
      isLoading = true;
    });

    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not logged in")),
        );
      }
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      // If you also want to fetch existing messages as notifications
      final data = await supabase
          .from('messages')
          .select()
          .eq('receiver_id', userId)
          .order('created_at', ascending: false);

      setState(() {
        notifications = data
            .map<Map<String, dynamic>>((msg) => {
          'id': msg['id'],
          'message':
          "Message from ${msg['sender_id']}: ${msg['content']}",
          'createdat': msg['created_at'],
          'isread': msg['is_read'],
        })
            .toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching messages: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load messages: $e')),
        );
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    messageChannel?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages Notifications"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
          ? const Center(child: Text("No messages found"))
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final createdAt = DateTime.parse(notif['createdat']);

          return ListTile(
            leading: const Icon(Icons.message, color: Colors.blue),
            title: Text(notif['message']),
            subtitle:
            Text("${createdAt.toLocal()}".split('.')[0]),
          );
        },
      ),
    );
  }
}
