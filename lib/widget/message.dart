import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String content;
  final bool fromMe;

  const Message({super.key, required this.content, this.fromMe = true});

  factory Message.me(String content) => Message(content: content);
  factory Message.bot(String content) => Message(content: content, fromMe: false);

  WidgetSpan codespan(String content) {
    return WidgetSpan(
        child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: Text(content),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: fromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: _MessageBubble(fromMe: fromMe, content: content),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.fromMe,
    required this.content,
  });

  final bool fromMe;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: fromMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.zero)
              : const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.zero),
          color: fromMe ? Colors.blue[600] : Colors.grey[300],
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 16.0,
            color: fromMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
