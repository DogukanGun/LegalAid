import 'package:flutter/material.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/service/formservice/form_title.dart';

import '../../res/size_resource.dart';
import '../../style/text_style.dart';

typedef StringToVoidFunc = void Function(String);
class TopicTitle extends StatefulWidget {

  String formTitle;
  final StringToVoidFunc onClick;
  bool defaultClicked;

  TopicTitle({Key? key,required this.formTitle,required this.defaultClicked,required this.onClick}) : super(key: key);

  @override
  State<TopicTitle> createState() => TopicTitleState();
}

class TopicTitleState extends State<TopicTitle> {
  bool clicked = false;

  void clickedFromParent(){
    setState((){
      clicked = !clicked;
    });
  }

  @override
  void initState() {
    super.initState();
    clicked = widget.defaultClicked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState((){
                  clicked = !clicked;
                });
                widget.onClick(widget.formTitle);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(SizeResource.smallDp),
                  primary: clicked ? ColorResource.redColor : Colors.grey),
              child: Text(
                  widget.formTitle,
                  style: clicked ? LegalAidTextStyle.foodListMenuTextWhite : LegalAidTextStyle.foodListMenuTextBlack)
          ),
        ],
      ),
    );
  }
}
