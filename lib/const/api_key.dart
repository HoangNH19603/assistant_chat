// ignore_for_file: constant_identifier_names
enum KEY {
  GEMINI("AIzaSyALwkPGJxZvrDIRPJsgJkRIEweKJbq4rFw"),
  GPT("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");

  const KEY(this.key);

  final String key;

  @override
  String toString() => key;
}