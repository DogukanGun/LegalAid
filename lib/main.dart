import 'package:flutter/material.dart';
import 'package:legalaid/feature/home/home_page.dart';
import 'package:legalaid/feature/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/Home':(BuildContext context)=>const HomePage(),
        '/Login':(BuildContext context)=>const LoginPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage()
    );
  }
}
