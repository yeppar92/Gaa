
import 'dart:convert';
import 'dart:io';

import 'package:daa/common/common.dart';
import 'package:daa/models/all_courses_model.dart';
import 'package:daa/models/login_model.dart';
import 'package:daa/models/reset_pass_model.dart';
import 'package:daa/models/sub_modules_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {



  final Dio _dio = new Dio();

  // for login api
  Future<Loginmodel> loginUser(String email,String pass) async {
    // Perform GET request to the endpoint "/users/<id>"
    var map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = pass;
   
    var url = Uri.parse('${Common.mainurl}login');
    print(url);
    Response loginData = await _dio.post(url.toString(), data:  {'email': email, 'password': pass});
    print('login Info: ${loginData.data}');
    Loginmodel loginModel = Loginmodel.fromJson(loginData.data);

    return loginModel;
  }

  // for modules api
 /* Future<SubModulesModel> getModules(String token) async {
    var url = Uri.parse('${Common.mainurl}allmodules');
    print(url);
    print("token is = $token");
    Response moduleData = await _dio.post(url.toString(),options: Options(headers: {"Content-Type":"application/json","Accept":"application/json","authorization":"Bearer $token"}));
    print('modules Info: ${moduleData.data}');
    SubModulesModel subModulesModel = SubModulesModel.fromJson(moduleData.data);
    return subModulesModel;
  }*/

  Future<SubModulesModel> getModules(String token) async {
    var url = Uri.parse('${Common.mainurl}allmodules');
    print(url);
    print("token is = $token");
    Response moduleData = await _dio.get(url.toString());
    print('modules Info: ${moduleData.data}');
    SubModulesModel subModulesModel = SubModulesModel.fromJson(moduleData.data);
    return subModulesModel;
  }

  // for get all courses api
  Future<AllCoursesModel> getAllCourses() async {
    var url = Uri.parse('${Common.mainurl}allcourses');
    print(url);
    Response moduleData = await _dio.get(url.toString());
    print('modules Info: ${moduleData.data}');
    AllCoursesModel allCoursesModel = AllCoursesModel.fromJson(moduleData.data);
    return allCoursesModel;
  }


  // for reset password api
  Future<ResetPassModel> resetPassword(String email) async {
    var url = Uri.parse('${Common.mainurl}reset');
    print(url);
    Response moduleData = await _dio.get("$url?email=$email");
    print('modules Info: ${moduleData.data}');
    ResetPassModel resetPassModel = ResetPassModel.fromJson(moduleData.data);
    return resetPassModel;
  }


  // for download the file


  /*Future downloadApk(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }*/


 
  

}