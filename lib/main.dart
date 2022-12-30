import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/feature/home/home_page.dart';
import 'package:legalaid/feature/login/domain/register_user_cubit.dart';
import 'package:legalaid/feature/login/login_page.dart';
import 'package:legalaid/res/color_resource.dart';

import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RegisterUserCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: <String,WidgetBuilder>{
          '/Home':(BuildContext context)=>const HomePage(),
          '/Login':(BuildContext context)=>const LoginPage()
        },
        theme: ThemeData(
          primaryColor: ColorResource.navbarColor,
        ),
        home: const LoginPage()
      ),
    );
  }
}
