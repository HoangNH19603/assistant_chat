import 'package:chat_with_ai/services/ai_service.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_with_ai/const/api_key.dart';

final class BardService extends AIServices {
  final GenerativeModel model;
  late ChatSession chat;

  BardService({required String name}) : model = GenerativeModel(model: "gemini-pro", apiKey: KEY.GEMINI.key), super(name: name) {
    chat = model.startChat();
  }

  @override
  Future<String> ask(String prompt) async {
    // final List<Content> content = [Content.text(prompt)];
    final Content content = Content.text(prompt);
    final GenerateContentResponse response = await chat.sendMessage(content);
    // final GenerateContentResponse response = await model.generateContent(content);
    return response.text ?? "Sorry! I can't find the answer for your question right now!";
  }

  // void newSession() async {
  //   model.startChat();
  // }
}