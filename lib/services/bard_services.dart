import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_with_ai/const/api_key.dart';

final class BardService {
  final GenerativeModel model;
  late ChatSession chat;

  BardService() : model = GenerativeModel(model: "gemini-pro", apiKey: KEY.GEMINI.key) {
    chat = model.startChat();
  }

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
