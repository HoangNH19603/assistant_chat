import 'package:chat_with_ai/services/ai_service.dart';

final class GptService extends AIServices {
  GptService({required String name}) : super(name: name);

  @override
  Future<String> ask(String prompt) {
    // TODO: implement ask
    throw UnimplementedError();
  }
}
