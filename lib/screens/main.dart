import 'dart:async';

import 'package:daa/screens/%20login/login.dart';
import 'package:daa/screens/dashboard/dashboard.dart';
import 'package:daa/screens/forgot_pass.dart';
import 'package:daa/screens/reset_pass.dart';
import 'package:daa/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(myApp());
  });
}

class myApp extends StatelessWidget {
  StreamController<bool> streamController = StreamController<bool>();

  myApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DAA",

        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,

          ),
        ),
        home: const Scaffold(body: Login1()));
  }
}
