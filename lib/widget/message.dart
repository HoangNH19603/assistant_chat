import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: fromMe ? Colors.blue[600] : Colors.grey[300],
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [Text(
          content,
          style: TextStyle(
            fontSize: 16.0,
            color: fromMe ? Colors.white : Colors.black,
          ),
          // overflow: TextOverflow.ellipsis,
        ),]
      ),
    );
  }
}
