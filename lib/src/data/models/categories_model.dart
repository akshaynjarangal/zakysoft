// To parse this JSON data, do
//
//     final categoriesListModel = categoriesListModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<CategoriesListModel> categoriesListModelFromJson(String str) =>
    List<CategoriesListModel>.from(
        json.decode(str).map((x) => CategoriesListModel.fromJson(x)));

String categoriesListModelToJson(List<CategoriesListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesListModel extends Equatable {
  const CategoriesListModel({
    this.id,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.parentId,
    this.isActive,
    this.isAvailableInApp,
  });

  final int? id;
  final String? name;
  final String? nameArabic;
  final String? imageUrl;
  final dynamic parentId;
  final int? isActive;
  final int? isAvailableInApp;

  CategoriesListModel copyWith({
    int? id,
    String? name,
    String? nameArabic,
    String? imageUrl,
    dynamic parentId,
    int? isActive,
    int? isAvailableInApp,
  }) =>
      CategoriesListModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        imageUrl: imageUrl ?? this.imageUrl,
        parentId: parentId ?? this.parentId,
        isActive: isActive ?? this.isActive,
        isAvailableInApp: isAvailableInApp ?? this.isAvailableInApp,
      );

  factory CategoriesListModel.fromJson(Map<String, dynamic> json) =>
      CategoriesListModel(
        id: json["id"],
        name: json["name"],
        nameArabic: json["name_arabic"],
        imageUrl: json["image_url"],
        parentId: json["parent_id"],
        isActive: json["IS_active"],
        isAvailableInApp: json["IS_available_in_app"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_arabic": nameArabic,
        "image_url": imageUrl,
        "parent_id": parentId,
        "IS_active": isActive,
        "IS_available_in_app": isAvailableInApp,
      };

  @override
  List<Object?> get props =>[id, name, nameArabic, imageUrl, parentId, isActive, isAvailableInApp];
}
