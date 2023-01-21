import 'package:flutter/material.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';

import '../data/question.dart';
import '../form_title_wrapper.dart';

class FileUpload extends StatefulWidget {
  FormQuestion formQuestion;
  FileUpload({Key? key,required this.formQuestion}) : super(key: key);

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitleWrapper(
          title: widget.formQuestion.question,
          explanition: widget.formQuestion.explanation,
        ),
        SizedBox(
          width: SizeResource.xxxlargeDp,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: ColorResource.redColor),
              child: Row(
                children: const [Text("Upload"),Spacer(), Icon(Icons.file_copy_sharp)],
              )),
        )
      ],
    );
  }
}
