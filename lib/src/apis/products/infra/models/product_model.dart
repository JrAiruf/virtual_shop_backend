// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../products_domain/entities/app_categories.dart';

class ProductModel extends AppProducts {
  String? id;
  String? title;
  String? description;
  double? price;
  AppCategories? category;
  List<dynamic>? size;
  List<dynamic>? images;

  ProductModel(
      {this.description,
      this.category,
      this.size,
      this.images,
      this.id,
      this.title,
      this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'size': size,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] * 1.0,
      category: AppCategories(),
      size: map['size'],
      images: map['images'],
    );
  }
  static AppProducts toAppProduct(Map<String, dynamic> map) {
    return AppProducts(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      category: AppCategories(),
      size: map['size'],
      images: map['images'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
