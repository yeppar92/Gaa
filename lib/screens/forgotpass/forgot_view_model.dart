import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../models/reset_pass_model.dart';
import '../../repository/common_repo.dart';
import '../dashboard/dashboard.dart';

class ForgotViewModel with ChangeNotifier {



  Future<ResetPassModel>fetchResetPassData(BuildContext context,String email)async{
    Common.showLoaderDialog(context);
    final apiResult =  await CommonRepository().getResetPassLink(email);
    Navigator.pop(context);
    if (apiResult.status.toString() == "1") {
      Common.showToast(apiResult.message.toString(), "green");

    } else {
      Common.showToast(apiResult.message.toString(), "red");
    }
    return apiResult;

  }

}
