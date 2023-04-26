/*
! How to Use:
Generate Presentation Layer
dart .\generator.dart feature product

Generate DataSource, UseCase, Repository & Model(Kosong)
dart .\generator.dart rdu product

Generate Presentation Layer, DataSource, UseCase, Repository & Model(Kosong)
dart .\generator.dart all product
*/

//dart .\generator.dart feature login
/*
  /features
    /login
      /view
      /controller
      /widget
*/

// rdu = Repository , DataSource & Usecase
//dart .\generator.dart rdu login
// Repository, DataSource & UseCase
/*
  /data
    remote_datasource
      login_datasource
        login_datasource.dart

  /domain
    repository
      login_repository
        login_repository.dart
    usecase
      login_usecase
        login_usecase.dart

*/
import 'dart:io';

void main(List args) async {
  var command = args[0];
  var value = args[1];

  DefaultDirectoryGenerator.generate();

  switch (command) {
    case "feature":
      FeatureGenerator.generate(value);
      break;
    case "rdu":
      RDUGenerator.generate(value);
      break;
    case "all":
      FeatureGenerator.generate(value);
      RDUGenerator.generate(value);
      break;
  }
}

class DefaultDirectoryGenerator {
  static generate() {
    List<String> files = [
      "./lib/core/error/_",
      "./lib/core/theme/_",
      "./lib/core/util/_",
      "./lib/core/widget/_",
      "./lib/data/local_datasource/_",
      "./lib/data/remote_datasource/_",
      "./lib/domain/repository/_",
      "./lib/domain/usecase/_",
    ];

    for (var file in files) {
      var f = File(file);
      f.createSync(recursive: true);
    }
  }
}

class FeatureGenerator {
  static generate(String value) async {
    String moduleName = value.split("/")[0];

    var viewFile = File("./lib/features/$value/view/${moduleName}_view.dart");
    var controllerFile =
        File("./lib/features/$value/controller/${moduleName}_controller.dart");
    var emptyWidgetFile = File("./lib/features/$value/widget/_");

    viewFile.createSync(recursive: true);
    controllerFile.createSync(recursive: true);
    emptyWidgetFile.createSync(recursive: true);

    viewFile.writeAsStringSync(await ViewGenerator.generate(value));
    controllerFile.writeAsStringSync(await ControllerGenerator.generate(value));
  }
}

class RDUGenerator {
  static generate(String value) async {
    String moduleName = value.split("/")[0];

    var datasourceFile = File(
        "./lib/data/remote_datasource/${value}_datasource/${moduleName}_datasource.dart");
    var repositoryFile = File(
        "./lib/domain/repository/${value}_repository/${moduleName}_repository.dart");
    var usecaseFile = File(
        "./lib/domain/usecase/${value}_usecase/${moduleName}_usecase.dart");
    var responseModelFile =
        File("./lib/domain/entity/$value/${moduleName}_response.dart");

    datasourceFile.createSync(recursive: true);
    repositoryFile.createSync(recursive: true);
    usecaseFile.createSync(recursive: true);
    responseModelFile.createSync(recursive: true);

    datasourceFile.writeAsStringSync(await DataSourceGenerator.generate(value));
    repositoryFile.writeAsStringSync(await RepositoryGenerator.generate(value));
    usecaseFile.writeAsStringSync(await UsecaseGenerator.generate(value));
    responseModelFile
        .writeAsStringSync(await ResponseModelGenerator.generate(value));
  }
}

class ViewGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
"""
        .replaceAll("Login", moduleName.toClassName())
        .replaceAll("login_controller", "${moduleName}_controller")
        .replaceAll("login_view", "${moduleName}_view")
        .trim();
  }
}

class ControllerGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
import 'package:flutter/material.dart';
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
}

"""
        .replaceAll("Login", moduleName.toClassName())
        .replaceAll("login_controller", "${moduleName}_controller")
        .replaceAll("login_view", "${moduleName}_view")
        .trim();
  }
}

class DataSourceGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
class LoginDataSource {

}
"""
        .replaceAll("Login", moduleName.toClassName())
        .trim();
  }
}

class RepositoryGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
class LoginRepository {

}
"""
        .replaceAll("Login", moduleName.toClassName())
        .trim();
  }
}

class UsecaseGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
class LoginUsecase {

}
"""
        .replaceAll("Login", moduleName.toClassName())
        .trim();
  }
}

class ResponseModelGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
class ${moduleName.toClassName()}Response {

}
"""
        .trim();
  }
}

extension StringExtension on String {
  String toClassName() {
    return split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('');
  }

  String toCamelCase() {
    List<String> words = split('_');
    String firstWord = words[0];
    String camelCase = firstWord +
        words
            .sublist(1)
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join('');
    return camelCase;
  }

  String toTitleCase() {
    List<String> words = split('_');
    String titleCase = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return titleCase;
  }
}
