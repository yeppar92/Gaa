import 'package:daa/screens/Dashboard.dart';
import 'package:daa/screens/Forgotpass.dart';
import 'package:daa/screens/Login.dart';
import 'package:daa/screens/%20login/Login1.dart';
import 'package:daa/screens/Resetpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/Common.dart';
import 'ModuleDetail.dart';
import 'Splash.dart';
import 'Verification.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new myApp());
  });
}

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DAA",

        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,

          ),
        ),
        home: Scaffold(body: Splash()));
  }
}
