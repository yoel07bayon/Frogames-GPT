import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:personal_ia/core/services/gemini_service.dart';
import 'package:personal_ia/features/chat/data/chat_message.dart';

class ChatProvider extends ChangeNotifier {
  final Logger logger = Logger();
  final GeminiService geminiService = GeminiService();

  bool _isSending = false;
  bool get isSending => _isSending;

  bool _isLoadResponse = false;
  bool get isLoadResponse => _isLoadResponse;

  List<ChatMessage>? _messages;
  List<ChatMessage>? get messages => _messages;

  final TextEditingController messageController = TextEditingController();

  void sendNewMessage() async {
    if (_isSending) return;

    _isSending = true;
    notifyListeners();

    try {
      final message = ChatMessage(
        chatId: 0,
        role: 'USER',
        content: messageController.text.trim(),
        timestamp: DateTime.now(),
      );

      await _saveMessage(message);
      _sendMessageToGemini(messageController.text.trim());

      messageController.clear();
    } catch (e) {
      logger.e('Error to send messages in chat: $e');
    } finally {
      _isSending = false;
      notifyListeners();
    }
  }

  Future<void> _saveMessage(ChatMessage message) async {
    // save in database
    _addMessageToUI(message);
  }

  void _addMessageToUI(ChatMessage message) {
    _messages ??= [];
    _messages!.add(message);

    notifyListeners();
  }

  void _sendMessageToGemini(String message) async {
    try {
      _isLoadResponse = true;

      String response = '';

      response = await geminiService.sendRequestToModel(message);

      final timestamp = DateTime.now();
      final responseMessage = ChatMessage(
        id: timestamp.microsecondsSinceEpoch,
        chatId: 0,
        role: 'GEMINI',
        content: response,
        timestamp: timestamp,
      );

      logger.d(responseMessage.content);

      _updateMessageToUI(responseMessage);
      _isLoadResponse = false;
    } catch (e) {
      _isLoadResponse = false;
      logger.e('Error sending message to Gemini: $e');
    }
  }

  void _updateMessageToUI(ChatMessage responseMessage) {
    final index = _messages!.indexWhere(
      (message) => message.id == responseMessage.id,
    );

    if (index != -1) {
      _messages![index] = responseMessage;

      notifyListeners();
    } else {
      _addMessageToUI(responseMessage);
    }
  }
}
