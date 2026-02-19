import 'package:flutter/material.dart';
import 'package:personal_ia/core/provider/chat_provider.dart';
import 'package:personal_ia/features/presentation/widgets/empty_chat_widget.dart';
import 'package:personal_ia/features/presentation/widgets/message_title_widget.dart';
import 'package:provider/provider.dart';

class MessageListWidget extends StatelessWidget {
  const MessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);

    final messages = provider.messages ?? [];

    if (messages.isEmpty) {
      return EmptyChatWidget();
    }

    return ListView.builder(
      itemCount: provider.messages?.length ?? 0,
      itemBuilder: (context, index) {
        final message = provider.messages![index];
        return MessageTitleWidget(chatMessage: message);
      },
    );
  }
}
