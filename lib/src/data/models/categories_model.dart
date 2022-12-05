// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel extends Equatable {
  const CategoriesModel({
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
  final int? parentId;
  final int? isActive;
  final int? isAvailableInApp;

  CategoriesModel copyWith({
    int? id,
    String? name,
    String? nameArabic,
    String? imageUrl,
    int? parentId,
    int? isActive,
    int? isAvailableInApp,
  }) =>
      CategoriesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        imageUrl: imageUrl ?? this.imageUrl,
        parentId: parentId ?? this.parentId,
        isActive: isActive ?? this.isActive,
        isAvailableInApp: isAvailableInApp ?? this.isAvailableInApp,
      );

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        nameArabic: json["name_arabic"] ?? null,
        imageUrl: json["image_url"] ?? null,
        parentId: json["parent_id"] ?? null,
        isActive: json["IS_active"] ?? null,
        isAvailableInApp: json["IS_available_in_app"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "name_arabic": nameArabic ?? null,
        "image_url": imageUrl ?? null,
        "parent_id": parentId ?? null,
        "IS_active": isActive ?? null,
        "IS_available_in_app": isAvailableInApp ?? null,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        nameArabic,
        imageUrl,
        parentId,
        isActive,
        isAvailableInApp,
      ];
}
