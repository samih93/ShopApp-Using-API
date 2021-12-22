import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelperShop {
  static Dio? dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        // },
      ),
    );

    // erooooorrrr befor added this
    //DioError [DioErrorType.other]: HandshakeException: Handshake error in client (OS Error: I/flutter ( 9085):
    // CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate(handshake.cc:359))

    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
