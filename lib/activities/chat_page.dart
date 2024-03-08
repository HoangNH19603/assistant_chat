import 'package:chat_with_ai/services/bard_services.dart';
import 'package:chat_with_ai/widget/input_form.dart';
import 'package:chat_with_ai/widget/message.dart';
import 'package:flutter/material.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {
  // final List<String> _myTypes = <String>[];
  final List<Message> _messages = <Message>[];

  // void _submitText(String content) => setState(() => _messages.add(Message.me(content)));

  Future<void> _askQuestion(String question) async {
    setState(() => _messages.add(Message.me(question)));
    try {
      final String response = await BardService().ask(question);
      setState(() {
        _messages.add(Message.bot(response));
      });
    } catch (e) {
        _messages.add(Message.bot('Error: $e'));
      setState(() {
      });
    }
  }

  Widget _buildMessage(String message) {
    return Message(content: message);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: FutureBuilder(
    //       future: BardService().ask('what is google gemini AI'),
    //       builder: (BuildContext context, AsyncSnapshot snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(child: CircularProgressIndicator());
    //         } else if (snapshot.hasError) {
    //           return Center(child: Text('Error: ${snapshot.error}'));
    //         }
    //         _messages.add(snapshot.data);
    //         return ListView.builder(
    //             itemCount: _messages.length,
    //             itemBuilder: (context, index) {
    //               return Message(content: _messages[index]);
    //             });
    //       }),
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: _messages.isEmpty
          ? const Center(child: Text('Don\'t have anything!'))
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // return _buildMessage(_messages[index]);
                      return _messages[index];
                    },
                    childCount: _messages.length,
                  ),
                ),
              ],
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     const String question = 'What is Google Gemini AI?';
      //     await _askQuestion(question);
      //   },
      //   child: const Icon(Icons.question_answer),
      // ),
      bottomNavigationBar: InputField(callback: _askQuestion),
    );
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: _messages.isEmpty
    //       ? const Center(child: CircularProgressIndicator())
    //       : ListView.builder(
    //           itemCount: _messages.length,
    //           itemBuilder: (context, index) {
    //             return _buildMessage(_messages[index]);
    //           },
    //         ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () async {
    //       const String question = 'What is Google Gemini AI?';
    //       await _askQuestion(question);
    //     },
    //     child: const Icon(Icons.question_answer),
    //   ),
    // );
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
    );
  }
}

class _Desktop extends StatefulWidget {
  const _Desktop();

  @override
  State<_Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<_Desktop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth < 500) {
        return const _Mobile();
      } else if (constraints.maxWidth < 1000) {
        return const _Tablet();
      }
      return const _Desktop();
    }));
  }
}
