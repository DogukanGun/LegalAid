import 'package:flutter/material.dart';

import '../../res/size_resource.dart';
import '../../style/text_style.dart';

class FormTitleWrapper extends StatelessWidget {

  String? title;

  FormTitleWrapper({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeResource.mediumDp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title != null ? title! : "No Question",
            style: LegalAidTextStyle.titleBlack,
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.question_mark))
        ],
      ),
    );
  }
}
