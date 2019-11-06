
import 'package:login_with_localapi/src/models/login_model.dart';
import 'package:login_with_localapi/src/models/response_login_model.dart';

import 'login_api_provider.dart';

class Repository {
  final loginApiProvider = LoginProvider();

  Future<ResponseLogin> login(LoginPost loginPost) =>
      loginApiProvider.login(loginPost);
}