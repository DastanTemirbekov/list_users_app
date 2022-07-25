import 'package:dio/dio.dart';
import 'package:list_users_app/helpers/catch_exceptions.dart';

class ApiRequester {
  static String url = "https://api.github.com/";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, data: param);
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
