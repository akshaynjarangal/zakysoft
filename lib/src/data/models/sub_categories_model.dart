// To parse this JSON data, do
//
//     final subCategoriesListModel = subCategoriesListModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<SubCategoriesListModel> subCategoriesListModelFromJson(String str) =>
    List<SubCategoriesListModel>.from(
        json.decode(str).map((x) => SubCategoriesListModel.fromJson(x)));

String subCategoriesListModelToJson(List<SubCategoriesListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoriesListModel extends Equatable {
  const SubCategoriesListModel({
    this.id,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.parentId,
  });

  final int? id;
  final String? name;
  final String? nameArabic;
  final String? imageUrl;
  final int? parentId;

  SubCategoriesListModel copyWith({
    int? id,
    String? name,
    String? nameArabic,
    String? imageUrl,
    int? parentId,
  }) =>
      SubCategoriesListModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        imageUrl: imageUrl ?? this.imageUrl,
        parentId: parentId ?? this.parentId,
      );

  factory SubCategoriesListModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesListModel(
        id: json["id"],
        name: json["name"],
        nameArabic: json["name_arabic"],
        imageUrl: json["image_url"],
        parentId: json["parent_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_arabic": nameArabic,
        "image_url": imageUrl,
        "parent_id": parentId,
      };

  @override
  List<Object?> get props => [id, name, nameArabic, imageUrl, parentId];
}
