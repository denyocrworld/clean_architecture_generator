import 'package:encrypt/encrypt.dart';

class Encryptor {
  static String encrypt(String value) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(value, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted.base64); // R4PxiU3h8YoIRqVowBXm36ZcCe

    return encrypted.base64;
  }

  String? tulis(String value) {
    return null;
  }
}

void main() {
  Encryptor.encrypt("Hello");
  Encryptor().tulis("value");
}


/*
Budi



*/