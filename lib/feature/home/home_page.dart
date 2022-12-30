import 'package:flutter/material.dart';
import 'package:legalaid/component/sidemenu/nav_drawer.dart';

import '../../res/color_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomNavDrawer(),
      appBar: AppBar(
        backgroundColor: ColorResource.navbarColor,
      ),
      body: Container(),
    );
  }
}
