import 'dart:convert';
CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      String? id, 
      String? categoryName, 
      String? categoryCode,}){
    _id = id;
    _categoryName = categoryName;
    _categoryCode = categoryCode;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['categoryName'];
    _categoryCode = json['categoryCode'];
  }
  String? _id;
  String? _categoryName;
  String? _categoryCode;
CategoryModel copyWith({  String? id,
  String? categoryName,
  String? categoryCode,
}) => CategoryModel(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  categoryCode: categoryCode ?? _categoryCode,
);
  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryCode => _categoryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryCode'] = _categoryCode;
    return map;
  }

}