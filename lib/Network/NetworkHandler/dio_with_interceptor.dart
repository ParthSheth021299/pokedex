/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 2:54 pm
 */
import 'package:dio/dio.dart';

class CustomDio {
  static final CustomDio _singleton = CustomDio._internal();
  var dio = Dio();

  factory CustomDio() {
    return _singleton;
  }

  Future<Dio> getDio() async {
    dio.interceptors.clear();
    dio.interceptors.add(getInterceptorsWrapper());
    return dio;
  }

  InterceptorsWrapper getInterceptorsWrapper() {
    return InterceptorsWrapper(onRequest: (
      RequestOptions requestOptions,
      RequestInterceptorHandler handler,
    ) {
      print("Headers--> \n ${requestOptions.headers}");
      print(
          " Type--> ${requestOptions.method} Request-->${requestOptions.uri} \n  ");
      print(
          " extra--> ${requestOptions.extra} data-->${requestOptions.data} queryParameters-->${requestOptions.queryParameters} \n  ");
      return handler.next(requestOptions);
    }, onResponse: (
      Response response,
      ResponseInterceptorHandler handler,
    ) {
      print("data--> ${response.data}");
      print(
          "Response-->${response.realUri} \n statusCode--> ${response.statusCode} \n path--> ${response.requestOptions.path}  \n Headers--> \n ${response.headers} ");

      return handler.next(response);
    }, onError: (DioError dioError, ErrorInterceptorHandler handler) {
      print("error -->${dioError.error} message -->${dioError.message}");
      print(
          "Type--> ${dioError.requestOptions.method} url-->${dioError.requestOptions.uri} \n Headers--> \n ${dioError.requestOptions.headers} data--> ${dioError.requestOptions.path}");

      handler.next(dioError);
    });
  }

  CustomDio._internal();
}
