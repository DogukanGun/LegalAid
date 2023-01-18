import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:legalaid/res/color_resource.dart';

import '../data/question.dart';
import '../form_title_wrapper.dart';

class LegalAidRadioButtons extends StatefulWidget {
  FormQuestion formQuestion;
  LegalAidRadioButtons({Key? key,required this.formQuestion}) : super(key: key);

  @override
  State<LegalAidRadioButtons> createState() => _LegalAidRadioButtonsState();
}

class _LegalAidRadioButtonsState extends State<LegalAidRadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormTitleWrapper(title: widget.formQuestion.question,),
        CustomRadioButton(
            elevation: 0,
            absoluteZeroSpacing: true,
            unSelectedColor: Theme.of(context).canvasColor,
            buttonLables: widget.formQuestion.questionControl!.options!.map((e) => e.value!).toList(),
            buttonValues: widget.formQuestion.questionControl!.options!.map((e) => e.value!).toList(),
            buttonTextStyle: const ButtonTextStyle(
                selectedColor: Colors.white,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 16)),
            radioButtonValue: (value) {
              print(value);
            },
            enableShape: true,
            selectedColor: ColorResource.redColor,
          ),
      ],
    );
  }
}
