import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:torogi/presentation/screens/chat_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Map<String, dynamic>> _conversations = [];
  bool _isLoading = true;
  final _supabase = Supabase.instance.client;
  RealtimeChannel? _channel;

  @override
  void initState() {
    super.initState();
    _loadConversations();
    _subscribeToMessages();
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }

  Future<void> _loadConversations() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .rpc('get_user_conversations', params: {'user_id': userId});
      setState(() {
        _conversations = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading conversations: $e')),
        );
      }
    }
  }

  void _subscribeToMessages() {
    final userId = _supabase.auth.currentUser!.id;
    _channel = _supabase
        .channel('public:messages:$userId')
        .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'messages',
      callback: (payload) {
        _loadConversations();
      },
    )
        .subscribe();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.green, // set to solid green
        automaticallyImplyLeading: false, // removes back button if any
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Messages',
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [

        ],
      ),


      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // Search Bar
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search messages',
                prefixIcon: Icon(Icons.search,
                    color: colorScheme.onSurfaceVariant),
                filled: true,
                fillColor: colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant),
              ),
              style: theme.textTheme.bodyMedium,
            ),
          ),

          // Conversations List
          Expanded(
            child: _conversations.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline,
                      size: 64,
                      color: colorScheme.onSurfaceVariant),
                  const SizedBox(height: 16),
                  Text(
                    'No messages yet',
                    style: theme.textTheme.bodyLarge!.copyWith(
                        color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: _conversations.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final conversation = _conversations[index];
                final unreadCount =
                    conversation['unread_count'] as int? ?? 0;
                final hasUnread = unreadCount > 0;
                final username =
                    conversation['username'] as String? ??
                        'Unknown User';
                final profilePic =
                conversation['profilepic'] as String?;
                final lastMessage =
                conversation['last_message'] as String?;
                final lastMessageTime =
                conversation['last_message_time'] as String?;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            userId: conversation[
                            'conversation_user_id'] as String,
                            username: username,
                          ),
                        ),
                      ).then((_) => _loadConversations());
                    },
                    child: Row(
                      children: [
                        // Profile Picture with unread border
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: hasUnread
                                  ? colorScheme.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: profilePic != null
                                ? NetworkImage(profilePic)
                                : null,
                            backgroundColor:
                            colorScheme.surfaceVariant,
                            child: profilePic == null
                                ? Text(
                                username[0].toUpperCase(),
                                style: theme
                                    .textTheme.titleMedium)
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Name & message
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: theme
                                    .textTheme.bodyLarge!
                                    .copyWith(
                                  fontWeight: hasUnread
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      lastMessage ??
                                          'No messages yet',
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: theme
                                          .textTheme.bodyMedium!
                                          .copyWith(
                                        color: hasUnread
                                            ? colorScheme.onSurface
                                            : colorScheme
                                            .onSurfaceVariant,
                                        fontWeight: hasUnread
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  if (lastMessageTime != null)
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          left: 8),
                                      child: Text(
                                        timeago.format(
                                          DateTime.parse(
                                              lastMessageTime),
                                          allowFromNow: true,
                                        ),
                                        style: theme
                                            .textTheme.bodySmall!
                                            .copyWith(
                                          color: hasUnread
                                              ? colorScheme.primary
                                              : colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Unread dot
                        if (hasUnread)
                          Container(
                            margin:
                            const EdgeInsets.only(left: 8),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
