import 'package:legalaid/service/translation/language.dart';
import 'package:legalaid/service/translation/translate_api_request.dart';
import 'package:legalaid/service/translation/translate_repository.dart';

class TranslateService {

  TranslateRepository translateRepository = TranslateRepository();

  Future<String> translate(String text, String language) {
    var requestBody = TranslationApiRequest(q: text,
        source: "de",
        target: language,
        format: "text",
        apiKey: "9ad58d2e-ce1b-43ba-8ea5-ab479d08c2f1"
    );
    return translateRepository.getTranslate(requestBody);
  }
}