import 'dart:convert';
import 'dart:io';

import '../encryptor/encryptor.dart';

class FileUtil {
  static writeCsv(String path, dynamic obj) {
    var jsonFile = File(path);
    jsonFile.writeAsStringSync("""
// --------------------
// Created At: ${DateTime.now()}
// Creator: Deny
// --------------------
${Encryptor.encrypt(jsonEncode(obj))}
""");
  }
}
