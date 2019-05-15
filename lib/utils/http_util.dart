import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter_neteasecloudmusic/common/constant.dart';


class HttpUtil {

  static Dio dio;



  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';

  // 请求超时时间
  static const int CONNECT_TIMEOUT = 10000; // 10s
  // 响应超时时间
  static const int RECEIVE_TIMEOUT = 3000; //3s

  static void request(
      String url,
      {String method, Map<String, String> params, Function callBack, Function errorCallBack}) async {

    method = method ?? GET;
    params = params ?? null;

    Dio dio = createInstance();

    String errorMsg = "";
    int statusCode;

    try {

      Response response;
      if (method == GET) {

        response = await dio.get(url, queryParameters: params);
      } else {

        response = await dio.post(url, data: params);
      }

      statusCode = response.statusCode;

      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }

    } on Exception catch (e) {

      print('请求出错：' + e.toString());
    } catch (exception) {

      _handError(errorCallBack, exception.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("请求异常<net> errorMsg :" + errorMsg);
  }

  /// 创建 dio 实例对象
  static Dio createInstance () {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(

        baseUrl: Constant.baseUrl,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  static clear () {
    dio = null;
  }

}