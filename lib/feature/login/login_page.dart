import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/feature/login/data/user.dart';
import 'package:legalaid/feature/login/domain/RegisterState.dart';
import 'package:legalaid/feature/login/domain/register_user_cubit.dart';
import 'package:legalaid/feature/login/login_texts.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../style/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(){
    context.read<RegisterUserCubit>().addUser(User(email: emailController.text, password: passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterUserCubit,RegisterState>(
        builder: (context, state) {
          if(state == RegisterState.Success){
            Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => false);
          }
          return Stack(
            children: [
              Visibility(
                visible: state == RegisterState.RequestSent,
                child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotate, /// Required, The loading type of the widget
                    colors: [ColorResource.navbarColor,ColorResource.redColor],       /// Optional, The color collections
                    strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: Colors.white,      /// Optional, Background of the widget
                    pathBackgroundColor: Colors.white   /// Optional, the stroke backgroundColor
                ),
              ),
              Row(
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
                                  login();
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
            ],
          );
        }
      ),
    );
  }
}
