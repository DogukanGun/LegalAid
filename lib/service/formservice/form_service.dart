
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:legalaid/component/form/data/form_response.dart';
import 'package:legalaid/service/formservice/form_title.dart';

class FormService{
  Future<FormResponse> getFormData(int currentTitle) async{

    var uri = Uri.parse(_getTitle(currentTitle));
    var response = await http.get(uri);
    var formResponse = FormResponse.fromJson(jsonDecode(response.body));
    return formResponse;
  }
  String _getTitle(int currentTitle){
    if(currentTitle == 0){
        return "https://tc-legal-aid.onrender.com/${FormTitle.person}";
    }else if(currentTitle == 1){
      return "https://tc-legal-aid.onrender.com/${FormTitle.kostentraeger}";
    }else{
      return "https://tc-legal-aid.onrender.com/${FormTitle.unterhalt}";
    }
  }
}