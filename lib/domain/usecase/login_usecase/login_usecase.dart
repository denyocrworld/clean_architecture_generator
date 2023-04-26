import '../../repository/login_repository/login_repository.dart';

class LoginUsecase {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return await LoginRepository().login(
      email: email,
      password: password,
    );
  }
}
