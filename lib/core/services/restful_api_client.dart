

import 'package:dio/dio.dart';

import 'dio_config.dart';

class RestfulApiClient{
  Dio dio = Dio();

  Future <dynamic>getRequest( String apiUrl,{Map<String,dynamic>? parms}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
        print(dio.options.baseUrl +apiUrl+dio.options.headers.toString());
      Response response = parms == null? await dio.get(apiUrl,) :await dio.get(apiUrl,queryParameters: parms);
      if (response.statusCode == 200|| response.statusCode == 201) {
        return response.data;
      }else{
        return response.data;
        // FailureModel failureModel;
        // failureModel = FailureModel.fromJson(response.data);
        //
        // return failureModel;
      }

    } catch (e) {
      throw Exception(e);
    }
  }

}