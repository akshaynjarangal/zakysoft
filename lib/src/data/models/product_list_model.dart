// To parse this JSON data, do
//
//     final productsListModel = productsListModelFromJson(jsonString);

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
  final int? brandId;
  final String? rating;
  final int? isInWishListCount;
  final int? ratingsCount;
  final int? sortPrice;
  final Category? category;
  final String? offers;
  final CartSummaries? cartSummaries;
  final Price? price;
  final Inventory? inventory;
  final List<Image>? images;
  final List<dynamic>? tags;
  final Storage? storage;

  ProductsListModel copyWith({
    String? name,
    int? id,
    String? nameArabic,
    int? categoryId,
    int? brandId,
    String? rating,
    int? isInWishListCount,
    int? ratingsCount,
    int? sortPrice,
    Category? category,
    String? offers,
    CartSummaries? cartSummaries,
    Price? price,
    Inventory? inventory,
    List<Image>? images,
    List<dynamic>? tags,
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
        name: json["name"],
        id: json["id"],
        nameArabic: json["name_arabic"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        rating: json["rating"],
        isInWishListCount: json["is_in_wish_list_count"],
        ratingsCount: json["ratings_count"],
        sortPrice: json["sort_price"],
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
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        storage:
            json["storage"] == null ? null : Storage.fromJson(json["storage"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "name_arabic": nameArabic,
        "category_id": categoryId,
        "brand_id": brandId,
        "rating": rating,
        "is_in_wish_list_count": isInWishListCount,
        "ratings_count": ratingsCount,
        "sort_price": sortPrice,
        "category": category?.toJson(),
        "offers": offers,
        "cart_summaries": cartSummaries?.toJson(),
        "price": price?.toJson(),
        "inventory": inventory?.toJson(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "storage": storage?.toJson(),
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
        itemId: json["item_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "quantity": quantity,
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
  final Offers? offers;

  Category copyWith({
    int? id,
    int? parentId,
    Offers? offers,
  }) =>
      Category(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        offers: offers ?? this.offers,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"],
        offers: json["offers"] == null ? null : Offers.fromJson(json["offers"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "offers": offers?.toJson(),
      };

  @override
  List<Object?> get props => [id, parentId, offers];
}

class Offers extends Equatable {
  const Offers({
    this.id,
    this.discount,
    this.categoryId,
    this.pricebookId,
    this.maxUnit,
    this.discountType,
    this.priceBook,
  });

  final int? id;
  final int? discount;
  final int? categoryId;
  final int? pricebookId;
  final int? maxUnit;
  final String? discountType;
  final PriceBook? priceBook;

  Offers copyWith({
    int? id,
    int? discount,
    int? categoryId,
    int? pricebookId,
    int? maxUnit,
    String? discountType,
    PriceBook? priceBook,
  }) =>
      Offers(
        id: id ?? this.id,
        discount: discount ?? this.discount,
        categoryId: categoryId ?? this.categoryId,
        pricebookId: pricebookId ?? this.pricebookId,
        maxUnit: maxUnit ?? this.maxUnit,
        discountType: discountType ?? this.discountType,
        priceBook: priceBook ?? this.priceBook,
      );

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        id: json["id"],
        discount: json["discount"],
        categoryId: json["category_id"],
        pricebookId: json["pricebook_id"],
        maxUnit: json["max_unit"],
        discountType: json["discount_type"],
        priceBook: json["price_book"] == null
            ? null
            : PriceBook.fromJson(json["price_book"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "discount": discount,
        "category_id": categoryId,
        "pricebook_id": pricebookId,
        "max_unit": maxUnit,
        "discount_type": discountType,
        "price_book": priceBook?.toJson(),
      };

  @override
  List<Object?> get props =>
      [id, discount, categoryId, pricebookId, maxUnit, discountType, priceBook];
}

class PriceBook extends Equatable {
  const PriceBook({
    this.id,
    this.name,
    this.nameArabic,
    this.description,
    this.descriptionArabic,
    this.isActive,
    this.validFrom,
    this.validTo,
    this.file,
    this.imageArabic,
    this.isAvailableOfflineCustomer,
    this.discountType,
    this.type,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final String? name;
  final String? nameArabic;
  final String? description;
  final String? descriptionArabic;
  final int? isActive;
  final DateTime? validFrom;
  final DateTime? validTo;
  final String? file;
  final String? imageArabic;
  final int? isAvailableOfflineCustomer;
  final String? discountType;
  final String? type;
  final int? createdBy;
  final DateTime? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  PriceBook copyWith({
    int? id,
    String? name,
    String? nameArabic,
    String? description,
    String? descriptionArabic,
    int? isActive,
    DateTime? validFrom,
    DateTime? validTo,
    String? file,
    String? imageArabic,
    int? isAvailableOfflineCustomer,
    String? discountType,
    String? type,
    int? createdBy,
    DateTime? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      PriceBook(
        id: id ?? this.id,
        name: name ?? this.name,
        nameArabic: nameArabic ?? this.nameArabic,
        description: description ?? this.description,
        descriptionArabic: descriptionArabic ?? this.descriptionArabic,
        isActive: isActive ?? this.isActive,
        validFrom: validFrom ?? this.validFrom,
        validTo: validTo ?? this.validTo,
        file: file ?? this.file,
        imageArabic: imageArabic ?? this.imageArabic,
        isAvailableOfflineCustomer:
            isAvailableOfflineCustomer ?? this.isAvailableOfflineCustomer,
        discountType: discountType ?? this.discountType,
        type: type ?? this.type,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory PriceBook.fromJson(Map<String, dynamic> json) => PriceBook(
        id: json["id"],
        name: json["name"],
        nameArabic: json["name_arabic"],
        description: json["description"],
        descriptionArabic: json["description_arabic"],
        isActive: json["IS_active"],
        validFrom: json["valid_from"] == null
            ? null
            : DateTime.parse(json["valid_from"]),
        validTo:
            json["valid_to"] == null ? null : DateTime.parse(json["valid_to"]),
        file: json["file"],
        imageArabic: json["image_arabic"],
        isAvailableOfflineCustomer: json["IS_available_offline_customer"],
        discountType: json["discount_type"],
        type: json["type"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"] == null
            ? null
            : DateTime.parse(json["updated_by"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_arabic": nameArabic,
        "description": description,
        "description_arabic": descriptionArabic,
        "IS_active": isActive,
        "valid_from": validFrom?.toIso8601String(),
        "valid_to": validTo?.toIso8601String(),
        "file": file,
        "image_arabic": imageArabic,
        "IS_available_offline_customer": isAvailableOfflineCustomer,
        "discount_type": discountType,
        "type": type,
        "created_by": createdBy,
        "updated_by": updatedBy?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        nameArabic,
        description,
        descriptionArabic,
        isActive,
        validFrom,
        validTo,
        file,
        imageArabic,
        isAvailableOfflineCustomer,
        discountType,
        type,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt
      ];
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
        productId: json["product_id"],
        imageUrl: json["image_url"],
        isDefault: json["IS_default"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "image_url": imageUrl,
        "IS_default": isDefault,
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
        id: json["id"],
        productId: json["product_id"],
        criticalPoint: json["critical_point"],
        isSalableNstocks: json["Is_salable_nstocks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "critical_point": criticalPoint,
        "Is_salable_nstocks": isSalableNstocks,
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
  final int? salePrice;
  final int? taxId;
  final Tax? tax;

  Price copyWith({
    int? id,
    int? productId,
    int? salePrice,
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
        id: json["id"],
        productId: json["product_id"],
        salePrice: json["sale_price"],
        taxId: json["tax_id"],
        tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "sale_price": salePrice,
        "tax_id": taxId,
        "tax": tax?.toJson(),
      };

  @override
  List<Object?> get props => [id, productId, salePrice, taxId, tax];
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
        id: json["id"],
        name: json["name"],
        nameArabic: json["name_arabic"],
        rate: json["rate"],
        isPriceInclude: json["IS_price_include"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_arabic": nameArabic,
        "rate": rate,
        "IS_price_include": isPriceInclude,
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
        id: json["id"],
        productId: json["product_id"],
        quantityOnhand: json["quantity_onhand"],
        quantityReserved: json["quantity_reserved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "quantity_onhand": quantityOnhand,
        "quantity_reserved": quantityReserved,
      };

  @override
  List<Object?> get props => [id, productId, quantityOnhand, quantityReserved];
}
