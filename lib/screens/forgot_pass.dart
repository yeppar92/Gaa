
import 'package:daa/common/custom_strings.dart';
import 'package:daa/screens/reset_pass.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';
import '../common/custom_colors.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';
import 'dashboard/dashboard.dart';


class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  ForgotState createState() => ForgotState();
}

class ForgotState extends State<Forgotpass> {
 TextEditingController emailController = TextEditingController();

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
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,

        ),
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/back.jpg"),
                    fit: BoxFit.cover),
              ),
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
                            TextWidget(
                                text: Customstrings.forgot,
                                txtColor: CustomColors.colorHeader,
                                fontFamily: "PoppinBold",
                                fontSize: 24.0,
                                textAlign: TextAlign.left),
                            const SizedBox(height: 10,),
                            TextWidget(
                                text: Customstrings.forgot_email,
                                txtColor: Common.txtColor,
                                fontFamily: "PoppinRegular",
                                fontSize: 16.0,
                                textAlign: TextAlign.center),
                            const SizedBox(height: 40,),
                            TextFieldWidget(
                              onPressed: () => print("email"),
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



                            Container(
                              margin: const EdgeInsets.only(top: 30,bottom: 100),
                              height: 50,
                              width: double.infinity,
                              child:  RoundedButton(
                                  onPressed: ()  {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) => const Resetpass()));
                                  },
                                  textColor: Colors.white,
                                  btnColor: Common.colorAccent,
                                  rippleColor:
                                  Colors.white.withOpacity(.20),
                                  borderColor: Common.colorAccent,
                                  text: Customstrings.conti,
                                  height: 50.0,
                                  width: double.infinity,
                                  circularSize: 30.0)

                            ),
                          ],
                        ),
                      ),
                    
                  )
                ],
              )
    )]),
            ), 
           
        ));
  }
}
