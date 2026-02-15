import 'package:flutter/material.dart';
import '../../domain/chat_message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == ChatRole.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Theme.of(context).primaryColor : Colors.grey[800],
          borderRadius: BorderRadius.circular(12).copyWith(
            bottomRight: isUser ? Radius.zero : null,
            bottomLeft: isUser ? null : Radius.zero,
          ),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
