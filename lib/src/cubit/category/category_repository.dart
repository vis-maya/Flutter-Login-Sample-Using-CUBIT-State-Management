import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:form_f/src/models/CategoryModel.dart';
import 'package:form_f/src/models/api_response_model.dart';

import '../../helpers/api_helper.dart';

class CategoryRepository {
  Future<ApiResponseModel> addcategory(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper()
        .makePostRequest("/category", jsonEncode(categoryModel.toJson()));
    return response;
  }

  Future<ApiResponseModel> geAllCategory() async {
    ApiResponseModel response = await ApiHelper().makeGetRequest("/category");
    return response;
  }

  Future<ApiResponseModel> updateCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper().makePatchRequest(
        "/category/${categoryModel.id}", jsonEncode(categoryModel.toJson()));
    return response;
  }

  Future<ApiResponseModel> deleteCategoryById(CategoryModel categoryModel) async {
    ApiResponseModel response = await ApiHelper().makeDeleteRequest(
        "/category/${categoryModel.id}", jsonEncode(categoryModel.toJson()));
    return response;
  }
}
