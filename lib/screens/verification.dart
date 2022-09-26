import 'package:daa/common/custom_strings.dart';
import 'package:daa/screens/%20login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

import '../common/common.dart';
import 'dashboard/dashboard.dart';


class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  VerificationState createState() => VerificationState();
}

class VerificationState extends State<Verification> {
 var otpValue = "";
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
        value: const SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,

        ),
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Common.colorAccent,
              child:
    CustomScrollView(slivers: [
    SliverFillRemaining(
    hasScrollBody: false,
              child : Column(
                children: <Widget>[
                  const SizedBox(height: 60,),

                  const SizedBox(height: 60,),

                  Image.asset(
                      'assets/images/splashlogo.png'),
                  const Spacer(),
                  
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0)
                        )
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            Text(
                              Customstrings.verification,
                              style: const TextStyle(
                                  color: Common.txtColor,
                                  fontSize: 24,
                                  fontFamily: 'PoppinBold'),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              Customstrings.sent_code_email,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Common.txtColor,
                                  fontSize: 16,
                                  fontFamily: 'PoppinRegular'),
                            ),
                            const Text(
                              'av@gmail.com',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Common.txtColor,
                                  fontSize: 16,
                                  fontFamily: 'PoppinRegular'),
                            ),
                            const SizedBox(height: 20,),
                            PinCodeFields(
                              length: 4,
                              fieldBorderStyle: FieldBorderStyle.Square,
                              responsive: false,
                              fieldHeight:40.0,
                              fieldWidth: 40.0,
                              borderWidth:1.0,
                              activeBorderColor: Colors.white,
                              activeBackgroundColor: Common.colorAccent,
                              borderRadius: BorderRadius.circular(10.0),
                              keyboardType: TextInputType.number,
                              autoHideKeyboard: true,
                              fieldBackgroundColor: Common.list_divider,
                              borderColor: Colors.white,
                              textStyle: const TextStyle(
                                color: Common.txtColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              onComplete: (output) {
                                // Your logic with pin code

                                otpValue = output.toString();
                                print(output);
                              },
                              onChange: (output){
                                otpValue = output.toString();
                                print(output);
                              },
                            ),
                            const SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.center,
                              child :  Text.rich(
                                TextSpan(
                                  text: Customstrings.donthave,
                                  style: const TextStyle(color: Common.txtColor, fontSize: 14, fontFamily: 'PoppinRegular'),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: Customstrings.resend,
                                        style: const TextStyle(
                                          color: Common.colorAccent,
                                          fontFamily: 'PoppinRegular',
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {


                                          }),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 30,bottom: 60),
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },

                                child: Text(
                                  Customstrings.verify_otp,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'PoppinMedium'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                  )

                ],
              ))]),
            ),
          
           
        ));
  }
}
