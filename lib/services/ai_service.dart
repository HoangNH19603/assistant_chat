abstract class AIServices {
  final String name;
  AIServices({required this.name});
  Future<String> ask(String prompt);
}
