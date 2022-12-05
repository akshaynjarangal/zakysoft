// ignore_for_file: prefer_null_aware_operators, unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<ProductsListModel> productsListModelFromJson(String str) =>
    List<ProductsListModel>.from(
        json.decode(str).map((x) => ProductsListModel.fromJson(x)));

String productsListModelToJson(List<ProductsListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsListModel extends Equatable {
  const ProductsListModel({
    this.name,
    this.id,
    this.nameArabic,
    this.categoryId,
    this.brandId,
    this.rating,
    this.isInWishListCount,
    this.ratingsCount,
    this.sortPrice,
    this.category,
    this.offers,
    this.cartSummaries,
    this.price,
    this.inventory,
    this.images,
    this.tags,
    this.storage,
  });

  final String? name;
  final int? id;
  final String? nameArabic;
  final int? categoryId;
  final dynamic brandId;
  final String? rating;
  final int? isInWishListCount;
  final int? ratingsCount;
  final double? sortPrice;
  final Category? category;
  final dynamic offers;
  final CartSummaries? cartSummaries;
  final Price? price;
  final Inventory? inventory;
  final List<Image>? images;
  final List<TagElement>? tags;
  final Storage? storage;

  ProductsListModel copyWith({
    String? name,
    int? id,
    String? nameArabic,
    int? categoryId,
    dynamic brandId,
    String? rating,
    int? isInWishListCount,
    int? ratingsCount,
    double? sortPrice,
    Category? category,
    dynamic offers,
    CartSummaries? cartSummaries,
    Price? price,
    Inventory? inventory,
    List<Image>? images,
    List<TagElement>? tags,
    Storage? storage,
  }) =>
      ProductsListModel(
        name: name ?? this.name,
        id: id ?? this.id,
        nameArabic: nameArabic ?? this.nameArabic,
        categoryId: categoryId ?? this.categoryId,
        brandId: brandId ?? this.brandId,
        rating: rating ?? this.rating,
        isInWishListCount: isInWishListCount ?? this.isInWishListCount,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        sortPrice: sortPrice ?? this.sortPrice,
        category: category ?? this.category,
        offers: offers ?? this.offers,
        cartSummaries: cartSummaries ?? this.cartSummaries,
        price: price ?? this.price,
        inventory: inventory ?? this.inventory,
        images: images ?? this.images,
        tags: tags ?? this.tags,
        storage: storage ?? this.storage,
      );

  factory ProductsListModel.fromJson(Map<String, dynamic> json) =>
      ProductsListModel(
        name: json["name"] ?? null,
        id: json["id"] ?? null,
        nameArabic: json["name_arabic"] ?? null,
        categoryId: json["category_id"] ?? null,
        brandId: json["brand_id"],
        rating: json["rating"] ?? null,
        isInWishListCount: json["is_in_wish_list_count"] ?? null,
        ratingsCount: json["ratings_count"] ?? null,
        sortPrice:
            json["sort_price"] == null ? null : json["sort_price"].toDouble(),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        offers: json["offers"],
        cartSummaries: json["cart_summaries"] == null
            ? null
            : CartSummaries.fromJson(json["cart_summaries"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        inventory: json["inventory"] == null
            ? null
            : Inventory.fromJson(json["inventory"]),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        tags: json["tags"] == null
            ? null
            : List<TagElement>.from(
                json["tags"].map((x) => TagElement.fromJson(x))),
        storage:
            json["storage"] == null ? null : Storage.fromJson(json["storage"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? null,
        "id": id ?? null,
        "name_arabic": nameArabic ?? null,
        "category_id": categoryId ?? null,
        "brand_id": brandId,
        "rating": rating ?? null,
        "is_in_wish_list_count": isInWishListCount ?? null,
        "ratings_count": ratingsCount ?? null,
        "sort_price": sortPrice ?? null,
        "category": category == null ? null : category?.toJson(),
        "offers": offers,
        "cart_summaries":
            cartSummaries == null ? null : cartSummaries?.toJson(),
        "price": price == null ? null : price?.toJson(),
        "inventory": inventory == null ? null : inventory?.toJson(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "storage": storage == null ? null : storage?.toJson(),
      };

  @override
  List<Object?> get props => [
        name,
        id,
        nameArabic,
        categoryId,
        brandId,
        rating,
        isInWishListCount,
        ratingsCount,
        sortPrice,
        category,
        offers,
        cartSummaries,
        price,
        inventory,
        images,
        tags,
        storage
      ];
}

class CartSummaries extends Equatable {
  const CartSummaries({
    this.itemId,
    this.quantity,
  });

  final int? itemId;
  final int? quantity;

  CartSummaries copyWith({
    int? itemId,
    int? quantity,
  }) =>
      CartSummaries(
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
      );

  factory CartSummaries.fromJson(Map<String, dynamic> json) => CartSummaries(
        itemId: json["item_id"] ?? null,
        quantity: json["quantity"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId ?? null,
        "quantity": quantity ?? null,
      };

  @override
  List<Object?> get props => [itemId, quantity];
}

class Category extends Equatable {
  const Category({
    this.id,
    this.parentId,
    this.offers,
  });

  final int? id;
  final int? parentId;
  final dynamic offers;

  Category copyWith({
    int? id,
    int? parentId,
    dynamic offers,
  }) =>
      Category(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        offers: offers ?? this.offers,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? null,
        parentId: json["parent_id"] ?? null,
        offers: json["offers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "parent_id": parentId ?? null,
        "offers": offers,
      };

  @override
  List<Object?> get props => [id, parentId, offers];
}

class Image extends Equatable {
  const Image({
    this.productId,
    this.imageUrl,
    this.isDefault,
  });

  final int? productId;
  final String? imageUrl;
  final int? isDefault;

  Image copyWith({
    int? productId,
    String? imageUrl,
    int? isDefault,
  }) =>
      Image(
        productId: productId ?? this.productId,
        imageUrl: imageUrl ?? this.imageUrl,
        isDefault: isDefault ?? this.isDefault,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        productId: json["product_id"] ?? null,
        imageUrl: json["image_url"] ?? null,
        isDefault: json["IS_default"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId ?? null,
        "image_url": imageUrl ?? null,
        "IS_default": isDefault ?? null,
      };

  @override
  List<Object?> get props => [productId, imageUrl, isDefault];
}

class Inventory extends Equatable {
  const Inventory({
    this.id,
    this.productId,
    this.criticalPoint,
    this.isSalableNstocks,
  });

  final int? id;
  final int? productId;
  final int? criticalPoint;
  final int? isSalableNstocks;

  Inventory copyWith({
    int? id,
    int? productId,
    int? criticalPoint,
    int? isSalableNstocks,
  }) =>
      Inventory(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        criticalPoint: criticalPoint ?? this.criticalPoint,
        isSalableNstocks: isSalableNstocks ?? this.isSalableNstocks,
      );

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        criticalPoint: json["critical_point"] ?? null,
        isSalableNstocks: json["Is_salable_nstocks"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "product_id": productId ?? null,
        "critical_point": criticalPoint ?? null,
        "Is_salable_nstocks": isSalableNstocks ?? null,
      };

  @override
  List<Object?> get props => [id, productId, criticalPoint, isSalableNstocks];
}

class Price extends Equatable {
  const Price({
    this.id,
    this.productId,
    this.salePrice,
    this.taxId,
    this.tax,
  });

  final int? id;
  final int? productId;
  final double? salePrice;
  final int? taxId;
  final Tax? tax;

  Price copyWith({
    int? id,
    int? productId,
    double? salePrice,
    int? taxId,
    Tax? tax,
  }) =>
      Price(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        salePrice: salePrice ?? this.salePrice,
        taxId: taxId ?? this.taxId,
        tax: tax ?? this.tax,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        salePrice:
            json["sale_price"] == null ? null : json["sale_price"].toDouble(),
        taxId: json["tax_id"] ?? null,
        tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "product_id": productId ?? null,
        "sale_price": salePrice ?? null,
        "tax_id": taxId ?? null,
        "tax": tax == null ? null : tax?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        productId,
        salePrice,
        taxId,
        tax,
      ];
}

class Tax extends Equatable {
  const Tax({
    this.id,
    this.name,
    this.nameArabic,
    this.rate,
    this.isPriceInclude,
  });

  final int? id;
  final String? name;
  final String? nameArabic;
  final int? rate;
  final int? isPriceInclude;

  Tax copyWith({
    int? id,
    String? name,
    String? nameArabic,
    int? rate,
    int? isPriceInclude,
  }) =>
      Tax(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        rate: rate ?? this.rate,
        isPriceInclude: isPriceInclude ?? this.isPriceInclude,
      );

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        nameArabic: json["name_arabic"] ?? null,
        rate: json["rate"] ?? null,
        isPriceInclude: json["IS_price_include"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "name_arabic": nameArabic ?? null,
        "rate": rate ?? null,
        "IS_price_include": isPriceInclude ?? null,
      };

  @override
  List<Object?> get props => [id, name, nameArabic, rate, isPriceInclude];
}

class Storage extends Equatable {
  const Storage({
    this.id,
    this.productId,
    this.quantityOnhand,
    this.quantityReserved,
  });

  final int? id;
  final int? productId;
  final int? quantityOnhand;
  final int? quantityReserved;

  Storage copyWith({
    int? id,
    int? productId,
    int? quantityOnhand,
    int? quantityReserved,
  }) =>
      Storage(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        quantityOnhand: quantityOnhand ?? this.quantityOnhand,
        quantityReserved: quantityReserved ?? this.quantityReserved,
      );

  factory Storage.fromJson(Map<String, dynamic> json) => Storage(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        quantityOnhand: json["quantity_onhand"] ?? null,
        quantityReserved: json["quantity_reserved"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "product_id": productId ?? null,
        "quantity_onhand": quantityOnhand ?? null,
        "quantity_reserved": quantityReserved ?? null,
      };

  @override
  List<Object?> get props => [id, productId, quantityOnhand, quantityReserved];
}

class TagElement extends Equatable {
  const TagElement({
    this.id,
    this.productId,
    this.tagId,
    this.tag,
  });

  final int? id;
  final int? productId;
  final int? tagId;
  final TagTag? tag;

  TagElement copyWith({
    int? id,
    int? productId,
    int? tagId,
    TagTag? tag,
  }) =>
      TagElement(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        tagId: tagId ?? this.tagId,
        tag: tag ?? this.tag,
      );

  factory TagElement.fromJson(Map<String, dynamic> json) => TagElement(
        id: json["id"] ?? null,
        productId: json["product_id"] ?? null,
        tagId: json["tag_id"] ?? null,
        tag: json["tag"] == null ? null : TagTag.fromJson(json["tag"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "product_id": productId ?? null,
        "tag_id": tagId ?? null,
        "tag": tag == null ? null : tag?.toJson(),
      };

  @override
  List<Object?> get props => [id, productId, tagId, tag];
}

class TagTag extends Equatable {
  const TagTag({
    this.id,
    this.name,
    this.nameArabic,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final String? name;
  final String? nameArabic;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  TagTag copyWith({
    int? id,
    String? name,
    String? nameArabic,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      TagTag(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory TagTag.fromJson(Map<String, dynamic> json) => TagTag(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        nameArabic: json["name_arabic"] ?? null,
        isActive: json["IS_active"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "name_arabic": nameArabic ?? null,
        "IS_active": isActive ?? null,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };

  @override
  List<Object?> get props =>
      [id, name, nameArabic, isActive, createdAt, updatedAt, deletedAt];
}
