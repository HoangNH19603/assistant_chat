import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.messageText});

  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue[100],
      ),
      child: Text(
        messageText,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
