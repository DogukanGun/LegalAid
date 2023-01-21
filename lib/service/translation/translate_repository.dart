import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:legalaid/service/translation/translate_api_request.dart';

class TranslateRepository {
  Future<String> getTranslate(
      TranslationApiRequest translationApiRequest) async {
    var data = translationApiRequest.toJson();
    log('data: $data');
    try {
      if(translationApiRequest.q.isNotEmpty){
        var response = await Dio().post("https://libretranslate.com/translate", data: FormData.fromMap(data));
        String responseMessage = response.data.toString();
        responseMessage = responseMessage.split(":")[1];
        responseMessage = responseMessage.substring(0,responseMessage.length-1);
        log('data1: $responseMessage');
        return responseMessage;
      }
    } catch (e) {
      log('error: $e');
    }
    return "";
  }
}
