// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) =>
    CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    this.data,
  });

  List<Datum> data;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.businessId,
    this.code,
    this.parentId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.subCategories,
  });

  int id;
  String name;
  int businessId;
  String code;
  dynamic parentId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> subCategories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        code: json["code"],
        parentId: json["parent_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subCategories: List<dynamic>.from(json["sub_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "code": code,
        "parent_id": parentId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x)),
      };
}
