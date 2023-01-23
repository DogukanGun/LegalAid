import 'package:legalaid/component/form/data/question_control.dart';

class FormQuestion{
  int? id;
  String? question;
  String? pdfId;
  String? explanation;
  bool? questionTranslated = false;
  bool? questionIsShowed = false;
  QuestionControl? questionControl;

  FormQuestion({required this.id,required this.question,required this.explanation,required this.questionControl,required this.pdfId});

  factory FormQuestion.fromJson(Map<String,dynamic> response) => FormQuestion(
      id: response["id"],
      question: response["question"],
      explanation: response["explanation"],
      pdfId: response["pdfId"],
      questionControl: QuestionControl.fromJson(response["control"])
  );
}