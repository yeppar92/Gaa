import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../models/report_model.dart';
import '../../../repository/common_repo.dart';



class MainScreenViewModel with ChangeNotifier {



  Future<ReportModel>fetchDashReportData(BuildContext context,String token)async{
    Common.showLoaderDialog(context);
    final apiResult =  await CommonRepository().getDashboardReportData(token);
    Navigator.pop(context);
    return apiResult;

  }

}
