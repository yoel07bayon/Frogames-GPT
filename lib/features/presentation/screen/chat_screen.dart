import 'package:flutter/material.dart';
import 'package:personal_ia/features/presentation/widgets/app_screen_widgets.dart';
import 'package:personal_ia/features/presentation/widgets/chat_input_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(child: ChatInputWidget()),
    );
  }
}
