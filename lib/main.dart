import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/feature/application/startnew/domain/application_startnew_cubit.dart';
import 'package:legalaid/feature/application/startnew/translate_cubit.dart';
import 'package:legalaid/feature/home/home_page.dart';
import 'package:legalaid/feature/login/domain/register_user_cubit.dart';
import 'package:legalaid/feature/login/login_page.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/service/sessionmanager/legalaid_session_key.dart';
import 'package:legalaid/service/sessionmanager/legalaid_session_manager.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(create: (context)=>ApplicationStartnewCubit()),
        BlocProvider(create: (context)=>TranslateCubit()),
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
        home: SessionManager.getData<bool>(LegalAidSessionKey.LOGIN.name,false) ? const HomePage() : const LoginPage()
      ),
    );
  }
}
