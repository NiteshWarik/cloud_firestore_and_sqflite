import 'dart:io';

import 'package:dio/dio.dart';

class ApiServices{
 static Dio getBaseDio({Map<String, String>? header}){
   
    //dio.options.baseUrl = 'https://api.example.com';
     Map<String, String> headersMap = {};
    headersMap[HttpHeaders.contentTypeHeader] = 'application/json';
    BaseOptions options = BaseOptions(
      baseUrl: 'https://dummy.restapiexample.com/api/',
      responseType: ResponseType.json,
      headers: headersMap,
    );

    

    Dio dio = Dio(options);
    // add an interceptor for handling errors
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError e, handler) {
          // handle the error
          return handler.next(e);
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
  }
