
import 'package:daa/common/Customstrings.dart';
import 'package:daa/screens/Forgotpass.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


import '../common/ApiServices.dart';
import '../common/Common.dart';
import 'Dashboard.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login1> {
  var _passwordVisible = false,status = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    checkForPref();
  }

  checkForPref() async {}

  bool validate() {
    bool valid = true;
    if (!Common.isValidEmail(emailController.text)) {
      Common.showToast("Please enter your valid registered email.","red");
      valid = false;
    } else if (passController.text.isEmpty){
      Common.showToast("Please enter your password.","red");
      valid = false;
    }
    return valid;
  }

  callSignInApi() {
    Common.showLoaderDialog(context);
    final service = ApiServices();
    service.loginUser(emailController.text, passController.text).then((value) {
       Navigator.pop(context);
      if (value.status == true) {
        print("response login >>>>>> ${value.message}");
        Common.SetPreferences("token", value.token.toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder:
                    (BuildContext context) =>
                    const Dashboard()));
      } else {
        Common.showToast("Please check your credentials", "red");
      }
      



    });
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Common.colorAccent,
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
                                Text(
                                  Customstrings.signin,
                                  style: const TextStyle(
                                      color: Common.txtColor,
                                      fontSize: 24,
                                      fontFamily: 'PoppinBold'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  Customstrings.signinwith,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Common.txtColor,
                                      fontSize: 16,
                                      fontFamily: 'PoppinRegular'),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: emailController,
                                    cursorColor: Common.txtColor,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      fillColor: Common.list_divider,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      hintText: " ${Customstrings.email}",
                                      counterText: "",
                                      hintStyle: const TextStyle(
                                        color: Common.hintColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextField(
                                  controller: passController,
                                  cursorColor: Common.txtColor,
                                  style: const TextStyle(
                                    color: Common.txtColor,
                                  ),
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    fillColor: Common.list_divider,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(30.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(30.0),
                                    ),
                                    hintText: " ${Customstrings.pass}",
                                    counterText: "",
                                    hintStyle: const TextStyle(
                                      color: Common.hintColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Common.hintColor),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible =
                                              !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: Customstrings.forgot,
                                            style: const TextStyle(
                                              color: Common.colorAccent,
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
                                  margin:
                                      const EdgeInsets.only(top: 30, bottom: 60),
                                  height: 50,
                                  width: double.infinity,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    Common.colorAccent),
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    Common.rippleColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: const BorderSide(
                                              color: Common.colorAccent),
                                        ))),
                                    onPressed: () async {
                                      var status = await Permission.storage.status;
                                      if(!status.isGranted){
                                        await Permission.storage.request();
                                      }
                                      var status1 = await Permission.manageExternalStorage.status;
                                      if(!status1.isGranted){
                                        await Permission.manageExternalStorage.request();
                                      }


                                  if (status.isGranted && status1.isGranted) {
                                    if (validate()) {
                                      callSignInApi();
                                    }
                                  }

                                    },
                                    child: Text(
                                      Customstrings.signin,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'PoppinMedium'),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ))
              ])),
        ));
  }
}
