import 'package:flutter/material.dart';
import 'package:legalaid/style/text_style.dart';

import '../../res/color_resource.dart';
class NavItem {
  Color backgroundColor;
  Color itemColor;
  String text;
  IconData icon;

  NavItem({required this.backgroundColor,required this.text,required this.icon,required this.itemColor});

  void select(){
    backgroundColor = Colors.white;
    itemColor = ColorResource.redColor;
  }

  void unselect(){
    backgroundColor = Colors.transparent;
    itemColor = Colors.white;
  }

  TextStyle getTextStyle(){
    if(backgroundColor == Colors.transparent){
      return LegalAidTextStyle.foodListMenuSubTextWhite;
    }
    return LegalAidTextStyle.foodListMenuSubTextRed;
  }
}
