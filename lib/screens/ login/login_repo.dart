

import 'package:daa/models/login_model.dart';

import '../../common/api_services.dart';

class LoginRepository {

  Future<Loginmodel>loginUser(String email, String pass)async{
    final apiResult = await ApiServices().loginUser(email, pass);
    return apiResult;
  }

}