import 'package:dio/dio.dart';
import 'package:hyper_ui/data/user_data_source/user_data_source.dart';
import 'package:hyper_ui/domain/entity/user/user.dart';

class UserRepository {
  Future<List<User>> getUsers() async {
    var users = await UserDataSource().getUsers();
    var userResponse = UserResponse.fromJson(users);
    return userResponse.data;
  }

  Future<Response> getUserList() async {
    return await UserDataSource().getUserList();
  }
}
