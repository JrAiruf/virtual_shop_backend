// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

class ProductModel extends AppProducts {
  String? id;
  String? title;
  String? description;
  String? cid;
  double? price;
  List<dynamic>? size;
  List<dynamic>? images;

  ProductModel(
      {this.description,
      this.size,
      this.images,
      this.cid,
      this.id,
      this.title,
      this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cid': cid,
      'title': title,
      'description': description,
      'price': price,
      'size': size,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      cid: map['cid'] != null ? map['cid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] * 1.0,
      size: map['size'],
      images: map['images'],
    );
  }
  static AppProducts toAppProduct(Map<String, dynamic> map) {
    return AppProducts(
      id: map['id'],
      cid: map['cid'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      size: map['size'],
      images: map['images'],
    );
  }

  static ProductModel fromAppProduct(AppProducts proudct) {
    return ProductModel(
      id: proudct.id,
      cid: proudct.cid,
      title: proudct.title,
      description: proudct.description,
      price: proudct.price,
      size: proudct.size,
      images: proudct.images,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
      
}
