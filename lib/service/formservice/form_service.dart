
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legalaid/component/form/data/form_response.dart';
import 'package:legalaid/service/formservice/form_title.dart';

class FormService{

  static const questionTitleMap = {
    "A.1":"Name Vorname",
    "A.2":"Beruf, Erwerbstaetigkeit",
    "A.3":"Geburtsdatum",
    "A.4":"Familienstand",
    "A.5":"Anschrift",
    "A.6":"Tagsüber tel. erreichbar unter Nummer",
    "A.7":"Sofern vorhanden",
    "B.1":"In welcher Höhe?",
    "B.2":"Bezeichnung der Versicherung/des Organisation",
    "C.1":"Names des Unterhaltsverpflicteten.",
  };

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