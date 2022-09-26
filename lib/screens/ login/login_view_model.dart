import 'dart:async';

import 'package:daa/common/api_services.dart';
import 'package:daa/models/login_model.dart';
import 'package:daa/screens/%20login/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../dashboard/dashboard.dart';

class LoginViewModel with ChangeNotifier {

  StreamController<bool> streamController = StreamController<bool>();

   Future<void>fetchLoginData(BuildContext context,String email, String pass)async{
     Common.showLoaderDialog(context);
     final apiResult = await  await LoginRepository().loginUser(email,pass);
     Navigator.pop(context);
     if (apiResult.status == true) {
       print("response login >>>>>> ${apiResult.message}");
       Common.SetPreferences("token", apiResult.token.toString());
       Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (BuildContext context) =>
               Dashboard(streamController, streamController.stream)));
     } else {
       Common.showToast("Please check your credentials", "red");
     }
   }

}
