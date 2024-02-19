import 'dart:convert';

import 'package:evertec_mobile_test/app/modules/login/classes/login_model.dart';
import 'package:flutter/services.dart';

class LoginRepository {
  Future<bool> login(LoginModel loginModel) async {
    final response =
        await rootBundle.loadString('assets/credentials/credentials.json');

    final data = json.decode(response);
    final loginCredentials = LoginModel.fromJson(data);

    return (loginModel.document.toLowerCase() ==
            loginCredentials.document.toLowerCase() &&
        loginModel.documentNumber.toLowerCase() ==
            loginCredentials.documentNumber.toLowerCase() &&
        loginModel.password == loginCredentials.password);
  }
}
