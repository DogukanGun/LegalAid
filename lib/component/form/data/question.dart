import 'package:legalaid/component/form/data/question_control.dart';

class FormQuestion{
  int? id;
  String? question;
  String? explanation;
  QuestionControl? questionControl;

  FormQuestion({required this.id,required this.question,required this.explanation,required this.questionControl});

  factory FormQuestion.fromJson(Map<String,dynamic> response) => FormQuestion(
      id: response["id"],
      question: response["question"],
      explanation: response["explanation"],
      questionControl: QuestionControl.fromJson(response["control"])
  );
}