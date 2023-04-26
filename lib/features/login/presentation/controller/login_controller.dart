import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/domain/usecase/login_usecase/login_usecase.dart';
import 'package:hyper_ui/features/main_navigation/view/main_navigation_view.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "";
  String password = "";

  doLogin() async {
    //! Validasi
    var isLoggedIn = await LoginUsecase().login(
      email: email,
      password: password,
    );
    print(isLoggedIn);

    if (!isLoggedIn) {
      showInfoDialog("Wrong username or password");
      return;
    }

    Get.offAll(const MainNavigationView());
  }
}
