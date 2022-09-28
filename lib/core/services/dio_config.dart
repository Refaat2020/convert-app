import 'package:currencyconverter/core/constant/app_constant.dart';
import 'package:dio/dio.dart';

class DioConfigOptions {


  static Future<BaseOptions> getBaseOption() async {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 3000,
        followRedirects: true,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'apikey':AppConstant.apiKey
        });

    return options;
  }
}
