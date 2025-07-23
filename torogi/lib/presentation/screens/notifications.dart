import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'chat_screen.dart';
import 'login.dart'; // Import ChatScreen

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
    // Check authentication status
    if (supabase.auth.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _redirectToLogin();
      });
    } else {
      fetchNotifications();
      setupRealtimeMessageNotifications();
    }
  }

  void _redirectToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please log in to view notifications")),
    );
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
      callback: (payload) async {
        final newMessage = payload.newRecord;
        if (newMessage['receiver_id'] == userId) {
          final senderData = await supabase
              .from('users')
              .select('username')
              .eq('id', newMessage['sender_id'])
              .single();

          final senderName = senderData['username'] ?? 'Unknown';

          setState(() {
            notifications.insert(0, {
              'id': newMessage['id'],
              'sender_id': newMessage['sender_id'],
              'username': senderName,
              'content': newMessage['content'],
              'createdat': newMessage['created_at'],
              'isread': false,
            });
          });

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('New message from $senderName: ${newMessage['content']}'),
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'View',
                  onPressed: () {
                    markMessageAsRead(newMessage['id']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          userId: newMessage['sender_id'],
                          username: senderName,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
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
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final messages = await supabase
          .from('messages')
          .select('id, content, created_at, is_read, sender_id')
          .eq('receiver_id', userId)
          .order('created_at', ascending: false);

      List<Map<String, dynamic>> loadedNotifications = [];

      for (var msg in messages) {
        final senderData = await supabase
            .from('users')
            .select('username')
            .eq('id', msg['sender_id'])
            .maybeSingle();

        final senderName = senderData != null ? senderData['username'] : 'Unknown';

        loadedNotifications.add({
          'id': msg['id'],
          'sender_id': msg['sender_id'],
          'username': senderName,
          'content': msg['content'],
          'createdat': msg['created_at'],
          'isread': msg['is_read'],
        });
      }

      setState(() {
        notifications = loadedNotifications;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching messages: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load messages: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> markMessageAsRead(String messageId) async {
    try {
      await supabase
          .from('messages')
          .update({'is_read': true})
          .eq('id', messageId);
    } catch (e) {
      debugPrint('Error marking message as read: $e');
    }
  }

  @override
  void dispose() {
    messageChannel?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (supabase.auth.currentUser == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 60, color: Colors.grey.shade500),
              const SizedBox(height: 12),
              Text(
                "Please log in to view notifications",
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text(
          "Messages Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchNotifications,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off,
                size: 60, color: Colors.grey.shade500),
            const SizedBox(height: 12),
            Text(
              "No messages yet",
              style: TextStyle(
                  fontSize: 18, color: Colors.grey.shade600),
            ),
          ],
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final createdAt = DateTime.parse(notif['createdat']).toLocal();
          final formattedDate =
          DateFormat('MMM d, yyyy • h:mm a').format(createdAt);

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: const Icon(Icons.message, color: Colors.blue),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notif['username'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notif['content'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.6)),
                ),
              ),
              onTap: () {
                markMessageAsRead(notif['id']);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      userId: notif['sender_id'],
                      username: notif['username'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}