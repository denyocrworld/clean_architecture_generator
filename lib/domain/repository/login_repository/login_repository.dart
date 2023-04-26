import 'package:hyper_ui/data/login_data_source/login_data_source.dart';

class LoginRepository {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return await LoginDataSource().login(
      email: email,
      password: password,
    );
  }
}

//Service

//UseCase - Repository - DataSource
