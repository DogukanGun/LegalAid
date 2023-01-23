import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';

import '../data/question.dart';
import '../form_title_wrapper.dart';

class LegalAidRadioButtons extends StatefulWidget {
  FormQuestion formQuestion;

  LegalAidRadioButtons({Key? key, required this.formQuestion})
      : super(key: key);

  @override
  State<LegalAidRadioButtons> createState() => LegalAidRadioButtonsState();
}

class LegalAidRadioButtonsState extends State<LegalAidRadioButtons> {

  String getValue(){
    return _selectedValue;
  }
  String _selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormTitleWrapper(
          title: widget.formQuestion.question,
          explanition: widget.formQuestion.explanation,
        ),
        CustomRadioButton(
          elevation: 2,
          unSelectedColor: Theme.of(context).canvasColor,
          buttonLables: widget.formQuestion.questionControl!.options!
              .map((e) => e.value!)
              .toSet()
              .toList(),
          buttonValues: widget.formQuestion.questionControl!.options!
              .map((e) => e.value!)
              .toSet()
              .toList(),
          buttonTextStyle: const ButtonTextStyle(
              selectedColor: Colors.white,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 16)),
          radioButtonValue: (value) {
            print(value);
            _selectedValue = value.toString();
          },
          customShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(SizeResource.mediumDp))),
          horizontal: false,
          enableButtonWrap: true,
          autoWidth: true,
          enableShape: true,
          absoluteZeroSpacing: false,
          selectedColor: ColorResource.redColor,
        ),
      ],
    );
  }
}
