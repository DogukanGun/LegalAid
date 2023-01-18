import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/component/form/data/question.dart';
import 'package:legalaid/component/form/filefield/file_upload.dart';
import 'package:legalaid/component/form/inputfield/input_field.dart';
import 'package:legalaid/component/form/radiobuttons/radio_buttons.dart';
import 'package:legalaid/feature/application/startnew/application_startnew_cubit.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/service/formservice/form_service.dart';
import 'package:legalaid/service/translation/language.dart';
import 'package:legalaid/service/translation/translate_service.dart';

import '../../../style/text_style.dart';
import '../../login/login_texts.dart';

class ApplicationStartNew extends StatefulWidget {
  const ApplicationStartNew({Key? key}) : super(key: key);

  @override
  State<ApplicationStartNew> createState() => _ApplicationStartNewState();
}

class _ApplicationStartNewState extends State<ApplicationStartNew> {
  TranslateService translateService = TranslateService();
  FormService formService = FormService();

  String _language = Language.German.language;
  int currentIndex = 0;
  int titleIndex = 0;

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
                        log("lang:${value.toString()}");
                        setState(() {
                          _language = value.toString();
                          readJsonFile("Servus");
                        });
                      }
                    },
                  ),
                )),
            BlocBuilder<ApplicationStartnewCubit,List<FormQuestion>>(
                builder: (context,questions) {
                  return Padding(
                    padding: EdgeInsets.all(SizeResource.xxxlargeDp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        (() {
                          if (questions.isNotEmpty) {
                            return getCurrentQuestion(questions);
                          } else {
                            return const Text("wait");
                          }
                        }()),
                        Padding(
                          padding: EdgeInsets.only(top: SizeResource.largeDp),
                          child: ElevatedButton(
                              onPressed: () {
                                _pageControl(questions);
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(SizeResource.smallDp),
                                  primary: ColorResource.redColor),
                              child: Text(LoginText.loginButton,
                                  style: LegalAidTextStyle.foodListMenuTextWhite)),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ApplicationStartnewCubit>().getFormData(titleIndex);
  }

  void _pageControl(List<FormQuestion> questions) {
    setState(() {
      var newIndex = 0;
      if (questions[currentIndex].questionControl?.next_id != null) {
        newIndex = questions[currentIndex].questionControl!.next_id!;
        for(int i=0;i<questions.length;i++){
          if(questions[i].id == newIndex){
            newIndex = i;
          }
        }
      } else {
        newIndex = currentIndex + 1;
      }
      if (newIndex >= questions.length) {
        titleIndex += 1;
        currentIndex = 0;
        context.read<ApplicationStartnewCubit>().getFormData(titleIndex);
      } else {
        currentIndex = newIndex;
      }
    });
  }

  Widget getCurrentQuestion(List<FormQuestion> questions) {
    var question = questions[currentIndex];
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

  Future<String> readJsonFile(String text) async {
    var response = await translateService.translate(text, _language);
    return response;
  }
}
