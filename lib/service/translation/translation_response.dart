
class TranslationResponse{
  String translatedText;

  TranslationResponse({required this.translatedText});

  factory TranslationResponse.fromJson(Map<String, dynamic> json) => TranslationResponse(
      translatedText: json["translatedText"] as String
  );
}