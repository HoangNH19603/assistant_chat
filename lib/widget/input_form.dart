import 'package:flutter/material.dart';

typedef callback = void Function(String value);

class InputField extends StatefulWidget {
  const InputField({super.key});

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
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(hintText: 'Enter some text'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}