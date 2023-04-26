import 'package:dio/dio.dart';

class UserDataSource {
  Future<Map<String, dynamic>> getUsers() async {
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map<String, dynamic> obj = response.data;
    return obj;
  }

  Future<Response> getUserList() async {
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response;
  }
}
