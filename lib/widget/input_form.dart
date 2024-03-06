import 'package:flutter/material.dart';

typedef Callback = void Function(String value);

class InputField extends StatefulWidget {
  final Callback callback;
  const InputField({super.key, required this.callback});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter a message'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                widget.callback(_controller.text);
                _controller.clear();
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                widget.callback(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
    // return TextFormField(
    //   controller: _controller,
    //   decoration: const InputDecoration(hintText: 'Enter some text'),
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please enter some text';
    //     }
    //     return null;
    //   },
    //   onFieldSubmitted: (value) => widget.callback(value),
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
