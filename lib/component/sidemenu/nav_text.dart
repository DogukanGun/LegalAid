import 'package:flutter/material.dart';
import 'package:legalaid/component/sidemenu/nav_item.dart';
import 'package:legalaid/feature/application/review/application_review.dart';
import 'package:legalaid/feature/application/startnew/application_startnew.dart';
import 'package:legalaid/feature/settings/settings.dart';
import 'package:legalaid/res/color_resource.dart';

class NavText{
  static var title = "Iuribus Omnibus";
  static var applicationText = "New application";
  static var homeText = "Home";
  static var settingsText = "Settings";

  static var navItems = [
    NavItem(backgroundColor: Colors.white, text: homeText, icon: Icons.home,itemColor: ColorResource.redColor,page: const ApplicationReview()),
    NavItem(backgroundColor: Colors.transparent, text: applicationText, icon: Icons.file_present,itemColor: Colors.white,page: const ApplicationStartNew()),
    NavItem(backgroundColor: Colors.transparent, text: settingsText, icon: Icons.settings,itemColor: Colors.white,page: const Settings())
  ];
}