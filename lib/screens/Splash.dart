
import 'package:daa/screens/Login1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:async';
import 'dart:io' show Platform;
import '../common/Common.dart';
import 'Dashboard.dart';
import 'Login.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
 var deviceType = "";
 late bool _loading;
 late double _progressValue;

 @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
    checkForPref();
  }


  checkForPref() async {
    
    if (Platform.isAndroid)
      deviceType = "Android";
    else if (Platform.isIOS)
      deviceType = "Ios";

    String checkLogin = await Common.getPreferences("login");
    Timer(
        Duration(seconds: 3),
            () {
          if (checkLogin == "true") {
             Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Login1()));
          }
        }
    );
    
 
    
  }

 



 @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Common.colorAccent,
          statusBarIconBrightness: Brightness.light,
        ),

        child : Scaffold(
          body: Container(
              color: Common.colorAccent,
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/splashlogo.png"),
                      SizedBox(height: 10,),
                      Image.asset(
                          'assets/images/gaalogotext.png'),
                  SizedBox(height: 10,),
                 

                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 50,
                          animation: true,
                          lineHeight: 10.0,
                          animationDuration: 2000,
                          percent: 1,
                         
                          barRadius: const Radius.circular(16),
                          progressColor: Colors.white,
                        ),
                      ),

                 /* Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Common.colorAccent),
                      child :CircularProgressIndicator(
                        
                        strokeWidth: 5,
                        backgroundColor: Common.cardColor,
                        valueColor: new AlwaysStoppedAnimation<Color>(Common.orangeColor),
                        value: _progressValue,
                      )),
                      SizedBox(height: 10,),
                      Text('${(_progressValue * 100).round()}%',style: TextStyle(color: Colors.white,fontSize: 15),),*/
                    ],
                  ),
                )
                
               
              )
          ),
        )
    );
  }

}