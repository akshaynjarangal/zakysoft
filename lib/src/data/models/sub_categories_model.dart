// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<SubCategoriesModel> subCategoriesModelFromJson(String str) =>
    List<SubCategoriesModel>.from(
        json.decode(str).map((x) => SubCategoriesModel.fromJson(x)));

String subCategoriesModelToJson(List<SubCategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoriesModel extends Equatable {
  const SubCategoriesModel({
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

  SubCategoriesModel copyWith({
    int? id,
    String? name,
    String? nameArabic,
    String? imageUrl,
    int? parentId,
  }) =>
      SubCategoriesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        imageUrl: imageUrl ?? this.imageUrl,
        parentId: parentId ?? this.parentId,
      );

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        nameArabic: json["name_arabic"] ?? null,
        imageUrl: json["image_url"] ?? null,
        parentId: json["parent_id"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "name_arabic": nameArabic ?? null,
        "image_url": imageUrl ?? null,
        "parent_id": parentId ?? null,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        nameArabic,
        imageUrl,
        parentId,
      ];
}
