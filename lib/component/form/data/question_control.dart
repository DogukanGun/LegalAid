import 'dart:developer';

import 'package:legalaid/component/form/data/question_control_option.dart';

class QuestionControl{
  String? type;
  int? next_id;
  List<QuestionControlOption>? options;

  QuestionControl({required this.type,required this.next_id,required this.options});

  factory QuestionControl.fromJson(Map<String,dynamic> response) {
    return QuestionControl(
      type: response["type"],
      next_id: response["next_id"],
      options: response["options"] != null ? response["options"]
          .map<QuestionControlOption>((jsonArrayObject) =>
          QuestionControlOption.fromJson(jsonArrayObject))
          .toList() : null,
    );
  }

  @override
  String toString() {
    return 'QuestionControl{type: $type, next_id: $next_id, options: $options}';
  }
}
