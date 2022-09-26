import 'dart:async';


import 'package:daa/screens/dashboard/dashboard_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../models/sub_modules_model.dart';
import '../dashboard/dashboard.dart';

class DashboardViewModel with ChangeNotifier {

  Future<SubModulesModel>fetchModuleData(BuildContext context,String token)async{
    Common.showLoaderDialog(context);
    final apiResult =  await DashboardRepository().getModules(token);
      Navigator.pop(context);
      return apiResult;

  }

}
