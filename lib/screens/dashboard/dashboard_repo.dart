import '../../common/api_services.dart';
import '../../models/sub_modules_model.dart';

class DashboardRepository {

  Future<SubModulesModel>getModules(String token)async{
    final apiResult = await ApiServices().getModules(token);
    return apiResult;
  }

}