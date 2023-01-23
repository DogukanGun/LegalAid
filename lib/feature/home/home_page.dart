import 'package:flutter/material.dart';
import 'package:legalaid/component/sidemenu/nav_drawer.dart';
import 'package:legalaid/feature/application/review/application_review.dart';
import '../../res/color_resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  StatefulWidget _currentPage = const ApplicationReview();

  void pageCallback(StatefulWidget widget){
    setState((){_currentPage = widget;});
  }


  @override
  void initState() {
    super.initState();
    setState((){_currentPage = const ApplicationReview();});
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
