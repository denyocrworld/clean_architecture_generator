import 'package:dio/dio.dart';
import '../../entity/user/user.dart';
import '../../repository/user_repository/user_repository.dart';

class UserUsecase {
  Future<List<User>> getUsers() async {
    return await UserRepository().getUsers();
  }

  Future<Response> getUserList() async {
    return await UserRepository().getUserList();
  }
}
