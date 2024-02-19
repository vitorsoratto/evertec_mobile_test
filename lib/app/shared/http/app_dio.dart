import 'package:dio/dio.dart';
import 'package:evertec_mobile_test/app/shared/http/http_service.dart';
import 'package:evertec_mobile_test/app/shared/utils/constraints.dart';

class AppDio extends HttpService {
  final Dio dioClient = getDio(BaseOptions(baseUrl: baseUrl));

  static Dio getDio([BaseOptions? options]) {
    final Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  @override
  Future delete(String url) {
    return dioClient.delete(url);
  }

  @override
  Future get(String url) {
    return dioClient.get(url);
  }

  @override
  Future post(String url, {data}) {
    return dioClient.post(url, data: data);
  }

  @override
  Future put(String url, {data}) {
    return dioClient.put(url, data: data);
  }
}
