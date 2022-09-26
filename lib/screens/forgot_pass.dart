
import 'package:daa/common/custom_strings.dart';
import 'package:daa/screens/reset_pass.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';
import 'dashboard/dashboard.dart';


class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  ForgotState createState() => ForgotState();
}

class ForgotState extends State<Forgotpass> {


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
                            SizedBox(height: 10,),
                            Text(
                              Customstrings.forgot,
                              style: const TextStyle(
                                  color: Common.txtColor,
                                  fontSize: 24,
                                  fontFamily: 'PoppinBold'),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              Customstrings.forgot_email,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Common.txtColor,
                                  fontSize: 16,
                                  fontFamily: 'PoppinRegular'),
                            ),
                            const SizedBox(height: 40,),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                cursorColor: Common.txtColor,
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 10,
                                style : const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  fillColor: Common.list_divider,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color:Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  hintText: " ${Customstrings.email}",
                                  counterText: "",
                                  hintStyle: const TextStyle(
                                    color: Common.hintColor,
                                  ),
                                ),
                              ),
                            ),



                            Container(
                              margin: const EdgeInsets.only(top: 30,bottom: 100),
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
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => const Resetpass()));
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
              )
    )]),
            ), 
           
        ));
  }
}
