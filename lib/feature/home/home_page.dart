import 'package:flutter/material.dart';
import 'package:legalaid/component/informationbox/information.dart';
import 'package:legalaid/component/sidemenu/nav_drawer.dart';
import 'package:legalaid/feature/application/review/application_review.dart';
import 'package:legalaid/feature/application/startnew/application_startnew.dart';
import 'package:legalaid/feature/home/home_header.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/style/text_style.dart';

import '../../res/color_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  StatefulWidget _currentPage = const ApplicationStartNew();

  void pageCallback(StatefulWidget widget){
    setState((){_currentPage = widget;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomNavDrawer(pageCallback: pageCallback,),
      backgroundColor: ColorResource.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorResource.navbarColor,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: _currentPage
    );
  }
}
