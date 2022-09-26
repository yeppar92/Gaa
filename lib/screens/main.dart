import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash.dart';





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
