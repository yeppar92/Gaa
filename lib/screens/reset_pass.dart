import 'package:daa/common/custom_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';
import 'dashboard/dashboard.dart';
import 'verification.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({Key? key}) : super(key: key);

  @override
  ResetState createState() => ResetState();
}

class ResetState extends State<Resetpass> {
  var _passwordVisible = false, _cpasswordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _cpasswordVisible = false;
    checkForPref();
  }

  checkForPref() async {}

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
                              Text(
                                Customstrings.resetpass,
                                style: const TextStyle(
                                    color: Common.txtColor,
                                    fontSize: 24,
                                    fontFamily: 'PoppinBold'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                Customstrings.pass_valid,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Common.txtColor,
                                    fontSize: 16,
                                    fontFamily: 'PoppinRegular'),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextField(
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
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
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
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextField(
                                cursorColor: Common.txtColor,
                                style: const TextStyle(
                                  color: Common.txtColor,
                                ),
                                obscureText: !_cpasswordVisible,
                                decoration: InputDecoration(
                                  fillColor: Common.list_divider,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  hintText: " ${Customstrings.cpass}",
                                  counterText: "",
                                  hintStyle: const TextStyle(
                                    color: Common.hintColor,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _cpasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Common.hintColor),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _cpasswordVisible =
                                            !_cpasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30, bottom: 60),
                                height: 50,
                                width: double.infinity,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Common.colorAccent),
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Common.rippleColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Common.colorAccent),
                                      ))),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Verification()));
                                  },
                                  child: Text(
                                    Customstrings.conti,
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
                  ))
            ]),
          ),
        ));
  }
}
