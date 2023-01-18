class QuestionControlOption{
  int? id;
  String? value;
  int? next_id;

  QuestionControlOption({required this.id,required this.value,required this.next_id});

  factory QuestionControlOption.fromJson(Map<String,dynamic> response) => QuestionControlOption(
      id: response["id"],
      value: response["value"],
      next_id: response["next_id"],
  );

  @override
  String toString() {
    return 'QuestionControlOption{id: $id, value: $value, next_id: $next_id}';
  }
}