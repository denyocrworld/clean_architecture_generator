import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/domain/usecase/user_usecase/user_usecase.dart';

import '../../../domain/entity/user.dart';
import '../view/user_list_view.dart';

class UserListController extends State<UserListView> {
  static late UserListController instance;
  late UserListView view;

  @override
  void initState() {
    instance = this;
    getUsers();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<User> users = [];
  getUsers() async {
    users = await UserUsecase().getUsers();
    setState(() {});
  }

  Future<Response> getUserList() async {
    return await UserUsecase().getUserList();
  }
}
