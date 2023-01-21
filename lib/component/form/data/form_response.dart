import 'package:legalaid/component/form/data/question.dart';

class FormResponse{
  List<FormQuestion> questions;

  FormResponse({required this.questions});

  factory FormResponse.fromJson(List<dynamic> response){
    var jsonArray = response.map<FormQuestion>((json) => FormQuestion.fromJson(json)).toList();
    return FormResponse(questions:jsonArray);
  }
}