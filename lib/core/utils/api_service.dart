import 'package:dio/dio.dart';

class ApiService{
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://gutendex.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> get({required String url})async{
    var response = await dio.get(url);
    return response;
  }
}