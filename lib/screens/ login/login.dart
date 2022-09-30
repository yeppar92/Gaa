import 'dart:async';
import 'dart:math';

import 'package:daa/common/custom_colors.dart';
import 'package:daa/common/custom_strings.dart';
import 'package:daa/database/database_handler.dart';
import 'package:daa/screens/%20login/login_view_model.dart';
import 'package:daa/screens/forgot_pass.dart';
import 'package:daa/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/api_services.dart';
import '../../common/common.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_field_widget.dart';
import '../dashboard/dashboard.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login1> {
  var _passwordVisible = true, status = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  LoginViewModel loginViewModel = LoginViewModel();
  Database? database;
  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passController.dispose();
    loginViewModel.dispose();
  }

  checkForPref() async {}

  bool validate() {
    bool valid = true;
    if (!Common.isValidEmail(emailController.text)) {
      Common.showToast("Please enter your valid registered email.", "red");
      valid = false;
    } else if (passController.text.isEmpty) {
      Common.showToast("Please enter your password.", "red");
      valid = false;
    }
    return valid;
  }

  callSignInApi() {
    loginViewModel.fetchLoginData(context,emailController.text, passController.text);
  }

  Future<Database?> openDB() async {
   database = await DatabaseHandler().openDB();
   return database;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child:  WillPopScope(
        onWillPop: () async {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        return false;
        },
      child: Scaffold(
        extendBodyBehindAppBar: true,
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/back.jpg"),
                    fit: BoxFit.cover),
              ),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 120,
                        ),
                        Image.asset('assets/images/splashlogo.png'),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(50.0),
                                    topLeft: Radius.circular(50.0))),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                    text: Customstrings.signin,
                                    txtColor: CustomColors.colorHeader,
                                    fontFamily: "PoppinBold",
                                    fontSize: 24.0,
                                    textAlign: TextAlign.left),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                    text: Customstrings.signinwith,
                                    txtColor: Common.txtColor,
                                    fontFamily: "PoppinRegular",
                                    fontSize: 16.0,
                                    textAlign: TextAlign.center),
                                const SizedBox(
                                  height: 40,
                                ),
                                TextFieldWidget(
                                  onPressed: () => print("username"),
                                  controller: emailController,
                                  cursorColor: CustomColors.colorWhite,
                                  fillColor: CustomColors.colorTextField,
                                  hintTxt: Customstrings.email,
                                  txtColor: CustomColors.colorWhite,
                                  hintColor: CustomColors.colorWhite,
                                  enableColor: Colors.white,
                                  focusColor: Colors.white,
                                  obsucureTxt: false,
                                  checkPass: false,
                                  circularSize: 30.0,
                                  height: 50.0,
                                  width: double.infinity,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFieldWidget(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  controller: passController,
                                  cursorColor: CustomColors.colorWhite,
                                  fillColor: CustomColors.colorTextField,
                                  hintTxt: Customstrings.pass,
                                  txtColor: CustomColors.colorWhite,
                                  hintColor: CustomColors.colorWhite,
                                  enableColor: Colors.white,
                                  focusColor: Colors.white,
                                  obsucureTxt: _passwordVisible,
                                  checkPass: true,
                                  circularSize: 30.0,
                                  height: 50.0,
                                  width: double.infinity,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text.rich(
                                    TextSpan(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: Customstrings.forgot,
                                            style: const TextStyle(
                                              color: CustomColors.colorHeader,
                                              fontFamily: 'PoppinRegular',
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                  builder: (BuildContext
                                                                context) =>
                                                            const Forgotpass()));
                                              }),
                                        // can add more TextSpans here...
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, bottom: 60),
                                    child: RoundedButton(
                                        onPressed: () async {
                                          var status =
                                              await Permission.storage.status;
                                          if (!status.isGranted) {
                                            await Permission.storage.request();
                                          }
                                          var status1 = await Permission
                                              .manageExternalStorage.status;
                                          if (!status1.isGranted) {
                                            await Permission
                                                .manageExternalStorage
                                                .request();
                                          }

                                          if (status.isGranted &&
                                              status1.isGranted) {
                                            if (validate()) {
                                              callSignInApi();
                                            }
                                          }
                                        },
                                        textColor: Colors.white,
                                        btnColor: Common.colorAccent,
                                        rippleColor:
                                            Colors.white.withOpacity(.20),
                                        borderColor: Common.colorAccent,
                                        text: Customstrings.signin,
                                        height: 50.0,
                                        width: double.infinity,
                                        circularSize: 30.0)),
                              ],
                            )),
                      ],
                    ))
              ])),
        )));
  }
}
