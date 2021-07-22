import 'dart:convert';

import 'package:store_app/src/models/product.dart';

WishList wishListFromJson(String str) => WishList.fromJson(json.decode(str));

// String wishListToJson(WishList data) => json.encode(data.toJson());

class WishList {
  WishList({
    this.id,
    this.createdAt,
    this.items,
  });

  int id;
  String createdAt;
  List<Product> items;

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        id: json["id"],
        createdAt: json["created_at"],
        items:
            List<Product>.from(json["items"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}

class Item {
  Item({
    this.id,
    this.product,
    this.variants,
    this.wholesaleVariants,
    this.createdAt,
  });

  int id;
  int product;
  List<int> variants;
  List<WholesaleVariant> wholesaleVariants;
  String createdAt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        product: json["product"],
        variants: List<int>.from(json["variants"].map((x) => x)),
        wholesaleVariants: List<WholesaleVariant>.from(
            json["wholesale_variants"]
                .map((x) => WholesaleVariant.fromJson(x))),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "wholesale_variants":
            List<dynamic>.from(wholesaleVariants.map((x) => x.toJson())),
        "created_at": createdAt,
      };
}

class WholesaleVariant {
  WholesaleVariant({
    this.id,
    this.name,
    this.variant,
    this.image,
    this.minQty,
    this.perItemQty,
    this.packSize,
    this.price,
    this.discountedPrice,
  });

  int id;
  String name;
  Variant variant;
  String image;
  int minQty;
  int perItemQty;
  int packSize;
  int price;
  int discountedPrice;

  factory WholesaleVariant.fromJson(Map<String, dynamic> json) =>
      WholesaleVariant(
        id: json["id"],
        name: json["name"],
        variant: Variant.fromJson(json["variant"]),
        image: json["image"],
        minQty: json["min_qty"],
        perItemQty: json["per_item_qty"],
        packSize: json["pack_size"],
        price: json["price"],
        discountedPrice: json["discounted_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "variant": variant.toJson(),
        "image": image,
        "min_qty": minQty,
        "per_item_qty": perItemQty,
        "pack_size": packSize,
        "price": price,
        "discounted_price": discountedPrice,
      };
}

class Variant {
  Variant({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
