// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

import '../../products_domain/entities/product_info.dart';

class ProductModel extends AppProducts {
  String? id;
  String? title;
  double? price;
  ProductInfo? info;
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.info,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'info': info,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      info: map['info'],
    );
  }
  static AppProducts toAppProduct(Map<String, dynamic> map) {
    return AppProducts(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      info: map['info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
