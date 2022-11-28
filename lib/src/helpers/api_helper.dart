import 'package:dio/dio.dart';
import 'package:form_f/src/models/api_response_model.dart';

class ApiHelper {
  // or new Dio with a BaseOptions instance.
  static var options = BaseOptions(
    baseUrl: 'http://15.206.27.26',
    connectTimeout: 20000,
    receiveTimeout: 40000,
  );
  Dio dio = Dio(options);

  static final ApiHelper _instance =
      ApiHelper._internal(); //private data member - _instance

  factory ApiHelper() {
    return _instance;
  }
  ApiHelper._internal(); //named constructor

  Future<ApiResponseModel> makeGetRequest(String route,
      {Map<String, dynamic>? headers}) async {
    Map<String, dynamic> mHeaders = {};
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.get(route,
        options: Options(headers: mHeaders)); //route - endpnt
    ApiResponseModel apiResponseModel =
        ApiResponseModel.fromJson(response.data);
    return apiResponseModel;

    // if(response.statusCode  == 200){
    //
    // }else{
    //
    // }
  }

  Future<ApiResponseModel> makePostRequest(String route, dynamic data,
      {Map<String, dynamic>? headers}) async {
    Map<String, dynamic> mHeaders = {};
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
        await dio.post(route, options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
        ApiResponseModel.fromJson(response.data);
    return apiResponseModel;
  }

  Future<ApiResponseModel> makePatchRequest(String route, dynamic data,
      {Map<String, dynamic>? headers}) async {
    Map<String, dynamic> mHeaders = {};
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
        await dio.patch(route,data: data, options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
        ApiResponseModel.fromJson(response.data);
    return apiResponseModel;
  }

  Future<ApiResponseModel> makeDeleteRequest(String route, dynamic data,
      {Map<String, dynamic>? headers}) async {
    Map<String, dynamic> mHeaders = {};
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
        await dio.delete(route, options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
        ApiResponseModel.fromJson(response.data);
    return apiResponseModel;
  }
}
