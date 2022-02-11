import 'package:dio/dio.dart';

class DioHelper {

  static Dio ?dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static  getData({
    String url='v2/top-headlines',
    Map<String, dynamic> ?query,
  }) async {
    return await dio!.get(
        url, queryParameters: query);
  }
}