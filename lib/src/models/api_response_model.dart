
class ApiResponseModel {
  bool status;
  dynamic data;
  String? error;
  String? token;

  ApiResponseModel({
     required this.status, this.data, this.error, this.token});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json["status"].toLowerCase() == 'true',
      data:  json["data"],
      error: json["error"],
      token: json["token"],
    );
  }


}