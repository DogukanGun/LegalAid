
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/component/form/data/question.dart';
import 'package:legalaid/service/translation/language.dart';
import '../../../service/translation/translate_service.dart';

import '../../../service/formservice/form_service.dart';
import 'application_startnew_state.dart';

class ApplicationStartnewCubit extends Cubit<ApplicationStartNewState> {
  ApplicationStartnewCubit():super(ApplicationStartNewState(formQuestions: [],formQuestion:null ));
  FormService formService = FormService();
  TranslateService translateService = TranslateService();

  Future<void> getFormData(int titleIndex) async {
    var response = await formService.getFormData(titleIndex);
    emit(ApplicationStartNewState(formQuestions: response.questions, formQuestion: null));
  }

  Future<void> convertToLanguage(
      FormQuestion formQuestion, String newLanguage,String prevLanguage) async {
    emit(ApplicationStartNewState(formQuestions: [], formQuestion: null));
    if(newLanguage == Language.German.language){
      emit(ApplicationStartNewState(formQuestions: [], formQuestion: formQuestion));
    }else{
      if (formQuestion.question != null) {
        log("question ${formQuestion.question!}");
        var response =
        await translateService.translate(formQuestion.question!, newLanguage,prevLanguage);
        formQuestion.question = response.toString();
      }
      if (formQuestion.explanation != null) {
        log("explanation ${formQuestion.question!}");
        var response =
        await translateService.translate(formQuestion.explanation!, newLanguage,prevLanguage);
        formQuestion.explanation = response.toString();
      }
      if (formQuestion.questionControl?.options != null) {
        for (int i = 0; i < formQuestion.questionControl!.options!.length; i++) {
          if (formQuestion.questionControl!.options![i].value != null) {
            var response = await translateService.translate(
                formQuestion.questionControl!.options![i].value!, newLanguage,prevLanguage);
            formQuestion.questionControl!.options![i].value = response.toString();
          }
        }
      }
      formQuestion.questionTranslated = true;
      log("emitlendi ${[formQuestion]}");
      emit(ApplicationStartNewState(formQuestions: [], formQuestion: formQuestion));
    }
  }
}