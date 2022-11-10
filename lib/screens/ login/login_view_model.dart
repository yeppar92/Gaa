import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../dashboard/dashboard.dart';
import 'login_repo.dart';

class LoginViewModel with ChangeNotifier {

  StreamController<bool> streamController = StreamController<bool>();

   Future<void>fetchLoginData(BuildContext context,String email, String pass)async{
     Common.showLoaderDialog(context);
     final apiResult = await  await LoginRepository().loginUser(email,pass);
     Navigator.pop(context);
     if (apiResult.status == true) {
       print("response login >>>>>> ${apiResult.message}");
       Common.SetPreferences("token", apiResult.token.toString());
       Common.SetPreferences("login", "true");
       Common.SetPreferences("username", apiResult.userDetail!.userName.toString());
       Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (BuildContext context) =>
               Dashboard(streamController, streamController.stream,apiResult.userDetail!.userName.toString())));
     } else {
       Common.showToast("Please check your credentials", "red");
     }
   }

}
