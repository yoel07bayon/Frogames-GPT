import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personal_ia/features/chat/data/chat_message.dart';

class MessageTitleWidget extends StatelessWidget {
  final ChatMessage chatMessage;

  const MessageTitleWidget({super.key, required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: MarkdownBody(
            data: chatMessage.content,
            selectable: true,
            styleSheet: MarkdownStyleSheet.fromTheme(
              Theme.of(context),
            ).copyWith(
              p: Theme.of(context).textTheme.bodyLarge,

              // Agrega estos para controlar los títulos H1, H2, H3
              h1: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              h2: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              h3: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),

              code: Theme.of(context).textTheme.bodySmall?.copyWith(
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),
          subtitle: Text(
            chatMessage.role,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
