import 'dart:convert';
import 'dart:html';

import 'package:form_f/src/helpers/api_helper.dart';
import 'package:form_f/src/models/api_response_model.dart';

class AuthenticationRepository {
  Future<ApiResponseModel> login(String email, String password) async {
    Map<String, dynamic> payload = {"email": email, "password": password};
    String encodeData = jsonEncode(payload);
    ApiResponseModel apiResponseModel =
        await ApiHelper().makePostRequest("/user/login", encodeData);
    return apiResponseModel;
  }
}
