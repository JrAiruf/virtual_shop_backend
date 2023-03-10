// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';

class ProductModel extends AppProducts {
  String? productid;
  String? title;
  String? description;
  int? price;
  List<dynamic>? size;
  List<dynamic>? images;

  ProductModel(
      {this.description,
      this.size,
      this.images,
      this.productid,
      this.title,
      this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productid': productid,
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
      productid: map['productid'] != null ? map['productid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'],
      size: map['size'],
      images: map['images'],
    );
  }
  static AppProducts toAppProduct({ProductModel? product}) {
    return AppProducts(
      productid:product!.productid,
      cid:product.cid,
      title:product.title,
      description:product.description,
      price:product.price,
      size:product.size,
      images:product.images,
    );
  }

  static ProductModel fromAppProduct(AppProducts proudct) {
    return ProductModel(
      productid: proudct.productid,
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
