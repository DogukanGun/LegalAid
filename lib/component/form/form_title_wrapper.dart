import 'package:flutter/material.dart';

import '../../res/size_resource.dart';
import '../../style/text_style.dart';

class FormTitleWrapper extends StatelessWidget {

  String? title;
  String? explanition;

  FormTitleWrapper({Key? key,required this.title,required this.explanition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeResource.mediumDp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title ?? "No Question",
              style: LegalAidTextStyle.titleBlack,
            ),
          ),
          Visibility(
            visible: explanition?.isNotEmpty == true,
            child: Tooltip(
                message: explanition ?? "No Explanition",
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.question_mark))
            ),
          )
        ],
      ),
    );
  }
}
