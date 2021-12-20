import 'package:dio/dio.dart';

class DioHelperNews {
  static Dio? dio;

  static Future<void> init() async {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }
}
