import 'package:dio/dio.dart';

class LoginDataSource {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "https://capekngoding.com/deny/api/auth/action/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      if (obj["success"] == true) return true;
      return false;
    } on Exception {
      return false;
    }
  }
}
