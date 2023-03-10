import 'package:flutter/material.dart';
import 'package:legalaid/res/color_resource.dart';
class LegalAidTextStyle{
  static var title = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600
  );
  static var titleWhite = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.white
  );
  static var titleBlack = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.black
  );
  static var foodListMenuTextBlack = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black
  );
  static var foodListMenuTextWhite = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );
  static var foodListMenuSubTextBlack = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );
  static var foodListMenuSubTextGray = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey
  );
  static var foodListMenuSubTextWhite = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white
  );
  static var foodListMenuSubTextRed = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorResource.redColor
  );
}