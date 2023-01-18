
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/component/form/data/question.dart';

import '../../../service/formservice/form_service.dart';

class ApplicationStartnewCubit extends Cubit<List<FormQuestion>> {
  ApplicationStartnewCubit():super(<FormQuestion>[]);
  FormService formService = FormService();

  Future<void> getFormData(int titleIndex) async {
    var response = await formService.getFormData(titleIndex);
    emit(response.questions);
  }

}