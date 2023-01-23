import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/feature/login/data/login_page_status.dart';
import 'package:legalaid/feature/login/data/user.dart';
import 'package:legalaid/feature/login/domain/RegisterState.dart';
import 'package:legalaid/feature/login/domain/register_user_cubit.dart';
import 'package:legalaid/feature/login/login_texts.dart';
import 'package:legalaid/res/color_resource.dart';
import 'package:legalaid/res/size_resource.dart';
import 'package:legalaid/service/sessionmanager/legalaid_session_key.dart';
import 'package:legalaid/service/sessionmanager/legalaid_session_manager.dart';
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
  LoginPageStatus loginPageStatus = LoginPageStatus.Login;

  void login(){
    context.read<RegisterUserCubit>().addUser(User(email: emailController.text, password: passwordController.text));
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterUserCubit,RegisterState>(
        builder: (context, state) {
          if(state == RegisterState.Success){
            WidgetsBinding.instance.addPostFrameCallback((_){
              SessionManager.putData(LegalAidSessionKey.LOGIN.name, true);
              Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => false);
            });
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
              Visibility(
                visible: state != RegisterState.RequestSent,
                child: Row(
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
                                loginPageStatus == LoginPageStatus.Login ? LoginText.formLoginTitle : LoginText.formRegisterTitle,
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
                                  child: Text(
                                      loginPageStatus == LoginPageStatus.Login ? LoginText.loginButton : LoginText.registerButton,
                                      style:LegalAidTextStyle.foodListMenuTextWhite
                                  )
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: SizeResource.xxxlargeDp),
                                child: GestureDetector(
                                  onTap:(){
                                    setState((){
                                      if(loginPageStatus == LoginPageStatus.Login){
                                        loginPageStatus = LoginPageStatus.Register;
                                      }else{
                                        loginPageStatus = LoginPageStatus.Login;
                                      }
                                    });
                                  },
                                  child: Text(
                                    loginPageStatus == LoginPageStatus.Login ? LoginText.registerText : LoginText.loginText,
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
              ),
            ],
          );
        }
      ),
    );
  }
}
