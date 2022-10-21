import 'dart:async';

import 'package:daa/common/api_services.dart';
import 'package:daa/common/custom_strings.dart';
import 'package:daa/models/login_model.dart';
import 'package:daa/models/report_model.dart';
import 'package:daa/repository/common_repo.dart';
import 'package:daa/screens/%20login/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/common.dart';



class MainScreenViewModel with ChangeNotifier {



  Future<ReportModel>fetchDashReportData(BuildContext context,String token)async{
    Common.showLoaderDialog(context);
    final apiResult =  await CommonRepository().getDashboardReportData(token);
    Navigator.pop(context);
    return apiResult;

  }

}
