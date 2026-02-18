import 'package:flutter/material.dart';
import 'package:personal_ia/core/provider/chat_provider.dart';
import 'package:personal_ia/features/presentation/widgets/buttons_chat.dart';
import 'package:provider/provider.dart';

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChatProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'Ask what you what',
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              ButtonsChat(),
            ],
          ),
        ],
      ),
    );
  }
}
