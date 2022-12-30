import 'package:flutter/material.dart';
import 'package:legalaid/feature/login/login_texts.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';

import '../../style/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("asset/legalaidimage.jpg"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeResource.xxxlargeDp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      LoginText.formLoginTitle,
                      textAlign: TextAlign.center,
                      style:LegalAidTextStyle.titleBlack
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeResource.xxlargeDp),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(label:Text(LoginText.formEmailTitle)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeResource.xxlargeDp),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(label:Text(LoginText.formPasswordTitle)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeResource.xxlargeDp),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(SizeResource.smallDp),
                            primary: ColorResource.redColor
                        ),
                        child: Text(LoginText.loginButton,style:LegalAidTextStyle.foodListMenuTextWhite)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeResource.xxxlargeDp),
                    child: GestureDetector(
                      onTap:(){
                        setState((){

                        });
                      },
                      child: Text(
                        LoginText.registerText,
                        textAlign: TextAlign.center,
                        style: LegalAidTextStyle.foodListMenuSubTextRed,
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
