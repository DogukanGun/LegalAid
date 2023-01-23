import 'package:flutter/material.dart';
import 'package:legalaid/res/size_resource.dart';

import '../../../style/text_style.dart';
import '../data/question.dart';
import '../form_title_wrapper.dart';

class LegalAidInputField extends StatefulWidget {
  FormQuestion formQuestion;
  LegalAidInputField({Key? key,required this.formQuestion}) : super(key: key);

  @override
  State<LegalAidInputField> createState() => LegalAidInputFieldState();
}

class LegalAidInputFieldState extends State<LegalAidInputField> {
  var textEditingController = TextEditingController();

  String getValue(){
    return textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitleWrapper(title: widget.formQuestion.question,explanition: widget.formQuestion.explanation,),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SizeResource.largeDp)),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write",
                contentPadding: EdgeInsets.all(SizeResource.largeDp)),
          ),
        ),
      ],
    );
  }
}
