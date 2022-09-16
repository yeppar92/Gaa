
import 'package:daa/common/Customstrings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/Common.dart';
import 'Dashboard.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  loginState createState() => loginState();
}

class loginState extends State<Login> {
  TextEditingController numberController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    checkForPref();
  }
  

  checkForPref() async {
   
  }

 

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Common.colorAccent,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(23.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60,),
                  Text('Login',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22
                    ),
                  ),

                  SizedBox(height: 60,),

                  Image.asset(
                      'assets/images/splashlogo.png'),

                  Image.asset(
                      'assets/images/gaalogotext.png'),

                
                  SizedBox(height: 40,),

                  Align(
                      alignment: Alignment.topLeft,
                      child : Text(
                        Customstrings.email,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      )
                  ),

                  SizedBox(height: 10,),

                  Container(
                    height: 50,
                    child: new TextField(
                      cursorColor: Common.colorAccent,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 10,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Common.tfbackColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Common.tfbackColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: 'Enter your email here',
                        counterText: "",
                        hintStyle: TextStyle(
                          color: Common.list_divider,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Align(
                      alignment: Alignment.topLeft,
                      child : Text(
                        Customstrings.pass,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      )
                  ),

                  SizedBox(height: 10,),

                  Container(
                    height: 50,
                    child: new TextField(
                      cursorColor: Common.colorAccent,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      maxLength: 10,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Common.tfbackColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Common.tfbackColor),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: 'Password',
                        counterText: "",
                        hintStyle: TextStyle(
                          color: Common.list_divider,
                        ),
                      ),
                    ),
                  ),

                 

                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 60,
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateColor.resolveWith(
                                  (states) =>
                              Colors.white),
                          overlayColor:
                          MaterialStateColor.resolveWith(
                                  (states) =>
                              Common.rippleColor),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Common.colorAccent),
                              ))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Dashboard()));
                      },

                      child: Text(
                        Customstrings.login,
                        style: TextStyle(
                            color: Common.colorAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: Customstrings.forgot,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'fontmedium',
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {


                              }),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text.rich(
                    TextSpan(
                      text: Customstrings.donthave,
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: Customstrings.joinhere,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'fontmedium',
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              

                              }),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
              IntrinsicHeight(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 20),
                      child : Image.asset(
                          'assets/images/fbicon.png')
                    ) ,

                      VerticalDivider(
                        color: Common.list_divider,
                        thickness: 1,
                      ),
                Padding(padding: EdgeInsets.only(left: 20),
                      child : Image.asset(
                          'assets/images/googleicon.png')),
                    ],
                  ))
                
                  
                  


                ],
              ),
            ),
          ),
        ));
  }
}
