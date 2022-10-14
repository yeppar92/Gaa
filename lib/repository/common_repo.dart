

import 'package:daa/models/all_courses_model.dart';
import 'package:daa/models/login_model.dart';
import 'package:daa/models/reset_pass_model.dart';

import '../../common/api_services.dart';

class CommonRepository {

  Future<AllCoursesModel>getAllCourses()async{
    final apiResult = await ApiServices().getAllCourses();
    return apiResult;
  }

  Future<ResetPassModel>getResetPassLink(String email)async{
    final apiResult = await ApiServices().resetPassword(email);
    return apiResult;
  }

}