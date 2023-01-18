
class TranslationApiRequest{
  String q;
  String source;
  String target;
  String format;
  String apiKey;

  TranslationApiRequest({
      required this.q,required this.source,required this.target,required this.format,required this.apiKey});

  Map<String, dynamic> toJson() => {
    "q": q,
    "source": source,
    "target": target,
    "format": format,
    "api_key": apiKey
  };
}