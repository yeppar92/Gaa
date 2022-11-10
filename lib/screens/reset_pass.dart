
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';
import '../common/custom_colors.dart';
import '../common/custom_strings.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';
import 'dashboard/dashboard.dart';
import 'verification.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({Key? key}) : super(key: key);

  @override
  ResetState createState() => ResetState();
}

class ResetState extends State<Resetpass> {
  var _passwordVisible = true, _cpasswordVisible = true;
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkForPref();
  }

  checkForPref() async {}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/back.jpg"),
                  fit: BoxFit.cover),
            ),
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset('assets/images/splashlogo.png'),
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
                                topLeft: Radius.circular(50.0))),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                  text: Customstrings.resetpass,
                                  txtColor: CustomColors.colorHeader,
                                  fontFamily: "PoppinBold",
                                  fontSize: 24.0,
                                  textAlign: TextAlign.left),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                  text: Customstrings.pass_valid,
                                  txtColor: Common.txtColor,
                                  fontFamily: "PoppinRegular",
                                  fontSize: 16.0,
                                  textAlign: TextAlign.center),
                              const SizedBox(
                                height: 40,
                              ),
                              TextFieldWidget(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                controller: passController,
                                textInputType: TextInputType.text,
                                maxLength: 100,
                                cursorColor: CustomColors.colorWhite,
                                fillColor: CustomColors.colorTextField,
                                hintTxt: Customstrings.pass,
                                txtColor: CustomColors.colorWhite,
                                hintColor: CustomColors.colorWhite,
                                enableColor: Colors.white,
                                focusColor: Colors.white,
                                obsucureTxt: _passwordVisible,
                                checkPass: true,
                                checkPrefix: false,
                                assetUrl: '',
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
                                    _cpasswordVisible = !_cpasswordVisible;
                                  });
                                },
                                controller: cpassController,
                                textInputType: TextInputType.text,
                                maxLength: 100,
                                cursorColor: CustomColors.colorWhite,
                                fillColor: CustomColors.colorTextField,
                                hintTxt: Customstrings.cpass,
                                txtColor: CustomColors.colorWhite,
                                hintColor: CustomColors.colorWhite,
                                enableColor: Colors.white,
                                focusColor: Colors.white,
                                obsucureTxt: _cpasswordVisible,
                                checkPass: true,
                                checkPrefix: false,
                                assetUrl: '',
                                circularSize: 30.0,
                                height: 50.0,
                                width: double.infinity,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30, bottom: 60),
                                height: 50,
                                width: double.infinity,
                                child:  RoundedButton(
                                    onPressed: ()  {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                              const Verification()));
                                    },
                                    textColor: Colors.white,
                                    btnColor: Common.colorAccent,
                                    rippleColor:
                                    Colors.white.withOpacity(.20),
                                    borderColor: Common.colorAccent,
                                    text: Customstrings.conti,
                                    height: 50.0,
                                    width: double.infinity,
                                    fontSize: 18.0,
                                    circularSize: 30.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
