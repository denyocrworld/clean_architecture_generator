import 'package:dio/dio.dart';

/*
1. Kode-nya mudah di baca
2. Kode-nya mudah di pake (diimplementasikan)
3. Tetap terapkan clean code
*/
class HTTPUtil {
  static Future<Map> get(String url) async {
    var response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    print(obj);
    return obj;
  }
}
