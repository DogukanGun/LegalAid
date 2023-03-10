import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/component/form/data/question.dart';
import 'package:legalaid/component/form/filefield/file_upload.dart';
import 'package:legalaid/component/form/inputfield/input_field.dart';
import 'package:legalaid/component/form/radiobuttons/radio_buttons.dart';
import 'package:legalaid/component/topictitle/topic_title.dart';
import 'package:legalaid/feature/application/startnew/domain/application_startnew_cubit.dart';
import 'package:legalaid/feature/application/startnew/domain/application_startnew_state.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/service/formservice/form_title.dart';
import 'package:legalaid/service/translation/language.dart';
import 'package:legalaid/service/translation/translate_service.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../style/text_style.dart';
import 'data/application_startnew_text.dart';

class ApplicationStartNew extends StatefulWidget {
  const ApplicationStartNew({Key? key}) : super(key: key);

  @override
  State<ApplicationStartNew> createState() => _ApplicationStartNewState();
}

class _ApplicationStartNewState extends State<ApplicationStartNew> with TickerProviderStateMixin {
  TranslateService translateService = TranslateService();
  late AnimationController controller;

  List<FormQuestion> questions = <FormQuestion>[];
  Map<String,GlobalKey> formTitles = {};
  String _language = Language.German.language;
  String _prevLanguage = Language.German.language;
  int currentIndex = 0;
  int titleIndex = 0;
  bool translationRequestSent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeResource.xlargeDp),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(SizeResource.xlargeDp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.all(SizeResource.mediumDp),
                child: SizedBox(
                  width: 50,
                  child: DropdownButton<String>(
                    value: _language,
                    icon: Icon(
                      Icons.flag,
                      color: ColorResource.redColor,
                    ),
                    items: Language.values
                        .map((e) => DropdownMenuItem(
                              value: e.language,
                              child: Text(e.language),
                            ))
                        .toList(),
                    onChanged: (Object? value) {
                      if (_language != value.toString()) {
                        setState(() {
                          _prevLanguage = _language;
                          _language = value.toString();
                        });
                        log("??evir iste??i geldi");
                        translationRequestSent = true;
                        context
                            .read<ApplicationStartnewCubit>()
                            .convertToLanguage(questions[currentIndex],
                                _language, _prevLanguage);
                      }
                    },
                  ),
                )),
            BlocBuilder<ApplicationStartnewCubit, ApplicationStartNewState>(
                builder: (context, questionsFromCubit) {
              return Padding(
                padding: EdgeInsets.all(SizeResource.xlargeDp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (() {
                      if (questionsFromCubit.formQuestion != null) {
                        return getCurrentQuestion(
                            questionsFromCubit.formQuestion!);
                      } else if (questionsFromCubit.formQuestions.isNotEmpty ==
                          true) {
                        log("data geldi uzunluk ${questionsFromCubit.formQuestions.length}");
                        log("veri locale al??nd??");
                        questions = questionsFromCubit.formQuestions;
                        context
                            .read<ApplicationStartnewCubit>()
                            .convertToLanguage(questions[currentIndex],
                                _language, _prevLanguage);
                        return getLoadingWidget();
                      } else {
                        return getLoadingWidget();
                      }
                    }()),
                    Visibility(
                      visible: questions.isNotEmpty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: SizeResource.largeDp),
                            child: ElevatedButton(
                                onPressed: () {
                                  _back();
                                },
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.all(SizeResource.smallDp),
                                    primary: ColorResource.redColor),
                                child: Text(
                                    ApplicationStartnewText.backButtonTitle,
                                    style: LegalAidTextStyle
                                        .foodListMenuTextWhite)),
                          ),
                          SizedBox(
                            width: SizeResource.mediumDp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeResource.largeDp),
                            child: ElevatedButton(
                                onPressed: () {
                                  _pageControl(questions);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.all(SizeResource.smallDp),
                                    primary: ColorResource.redColor),
                                child: Text(
                                    ApplicationStartnewText.nextButtonTitle,
                                    style: LegalAidTextStyle
                                        .foodListMenuTextWhite)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(SizeResource.mediumDp),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeResource.mediumDp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: FormTitle.getTitle().map((e) =>
                          Padding(
                            padding: EdgeInsets.all(SizeResource.mediumDp),
                            child: ((){
                              GlobalKey<TopicTitleState> key = GlobalKey();
                              formTitles[e] = key;
                              return TopicTitle(
                                key: key,
                                formTitle: e,
                                defaultClicked: _getDefaultClick(e),
                                onClick: (title){
                                  titleButtonClicked(title);
                                },
                              );
                            }())
                          )
                      ).toList()
                    ),
                  ),
                  LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(ColorResource.redColor),
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,);
    controller.value = 0.33;
    context.read<ApplicationStartnewCubit>().getFormData(titleIndex);
  }

  void titleButtonClicked(String title){
    var newTitleIndex = 0;
    if(title == FormTitle.person){
      newTitleIndex = 0;
      controller.value = 0.33;
    }else if(title == FormTitle.kostentraeger){
      newTitleIndex = 1;
      controller.value = 0.66;
    }else if(title == FormTitle.unterhalt){
      newTitleIndex = 2;
      controller.value = 0.97;
    }
    if(titleIndex != newTitleIndex){
      context.read<ApplicationStartnewCubit>().getFormData(newTitleIndex);
      setState((){
        for(var index in formTitles.entries){
          if(index.key != title){
            (index.value as GlobalKey<TopicTitleState>).currentState?.clickedFromParent();
          }
        }
        titleIndex = newTitleIndex;
      });
    }
  }

  bool _getDefaultClick(String formTitle){
    log("default click geldi $formTitle");
    if(titleIndex == 0){
      return formTitle == FormTitle.person;
    }else if(titleIndex == 1){
      return formTitle == FormTitle.kostentraeger;
    }else if(titleIndex == 2){
      return formTitle == FormTitle.unterhalt;
    }
    return false;
  }

  Widget getLoadingWidget() => SizedBox(
        width: SizeResource.mediumDp,
        height: SizeResource.mediumDp,
        child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotate,
            colors: [ColorResource.navbarColor, ColorResource.redColor],
            strokeWidth: 2,
            backgroundColor: Colors.white,
            pathBackgroundColor: Colors.black),
      );

  void _back() {
    var question = questions[currentIndex];
    var newIndex = -1;
    if (currentIndex != 0) {
      for (int i = 0; i < questions.length; i++) {
        if (questions[i].questionControl?.next_id == question.id) {
          newIndex = i;
        }
      }
    }
    if(newIndex == -1){
      newIndex = currentIndex != 0 ? currentIndex -1 : 0;
    }
    currentIndex = newIndex;
    context
        .read<ApplicationStartnewCubit>()
        .convertToLanguage(questions[currentIndex], _language, _prevLanguage);
  }

  void _pageControl(List<FormQuestion> questions) {
    var newIndex = 0;
    if (questions[currentIndex].questionControl?.next_id != null) {
      newIndex = questions[currentIndex].questionControl!.next_id!;
      for (int i = 0; i < questions.length; i++) {
        if (questions[i].id == newIndex) {
          newIndex = i;
        }
      }
    } else {
      newIndex = currentIndex + 1;
    }
    if (newIndex >= questions.length) {
      titleIndex += 1;
      currentIndex = 0;
      setState((){
        controller.value += 0.33;
      });
      context.read<ApplicationStartnewCubit>().getFormData(titleIndex);
    } else {
      currentIndex = newIndex;
      context
          .read<ApplicationStartnewCubit>()
          .convertToLanguage(questions[currentIndex], _language, _prevLanguage);
    }
  }

  Widget getCurrentQuestion(FormQuestion question) {
    log("current index $currentIndex");
    if (question.questionControl?.type == "upload") {
      return FileUpload(formQuestion: question);
    } else if (["text", "number", "date"]
        .contains(question.questionControl?.type)) {
      return LegalAidInputField(formQuestion: question);
    } else if (question.questionControl?.type == "single_choice") {
      return LegalAidRadioButtons(formQuestion: question);
    }
    return const Text("unknown field");
  }
}
