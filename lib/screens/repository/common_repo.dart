

import 'package:daa/models/all_courses_model.dart';
import 'package:daa/models/login_model.dart';

import '../../common/api_services.dart';

class CommonRepository {

  Future<AllCoursesModel>getAllCourses()async{
    final apiResult = await ApiServices().getAllCourses();
    return apiResult;
  }

}