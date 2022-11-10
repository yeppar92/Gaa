



import '../../common/api_services.dart';
import '../../models/login_model.dart';

class LoginRepository {

  Future<Loginmodel>loginUser(String email, String pass)async{
    final apiResult = await ApiServices().loginUser(email, pass);
    return apiResult;
  }

}