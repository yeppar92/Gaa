
import '../../common/api_services.dart';
import '../models/all_courses_model.dart';
import '../models/report_model.dart';
import '../models/reset_pass_model.dart';

class CommonRepository {

  Future<AllCoursesModel>getAllCourses()async{
    final apiResult = await ApiServices().getAllCourses();
    return apiResult;
  }

  Future<ResetPassModel>getResetPassLink(String email)async{
    final apiResult = await ApiServices().resetPassword(email);
    return apiResult;
  }

  Future<ReportModel>getDashboardReportData(String token)async{
    final apiResult = await ApiServices().getReports(token);
    return apiResult;
  }

}