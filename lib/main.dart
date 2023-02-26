import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/debug.dart';

product() {}

getUser() async {
  var response = await Dio().get(
    "https://reqres.in/api/users",
    options: Options(
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
  Map obj = response.data;
}

addProduct() async {
  var user = await getUser();

  var response = await Dio().post(
    "https://reqres.in/api/users",
    options: Options(
      headers: {
        "Content-Type": "application/json",
      },
    ),
    data: {
      "name": "morpheus",
      "job": "programmer",
    },
  );
  Map obj = response.data;
}

deleteProduct() {}
updateProduct() {}
getProduct() {}

dltProduct() {}
updtPrdct() {}

deleteProductOfCustomerFromDatabase() {}

addProductHttpRequest() {}
addProductLocalStorage() {}

void main() async {
  await initialize();

  Get.mainTheme.value = getDarkTheme();
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Get.mainTheme,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Capek Ngoding',
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: value,
          home: const TutorialDemoView(),
          builder: (context, child) => debugView(
            context: context,
            child: child,
            visible: true,
          ),
        );
      },
    );
  }
}
