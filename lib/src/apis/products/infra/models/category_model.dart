// ignore_for_file: annotate_overrides
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import '../../products_domain/entities/app_products.dart';

class CategoryModel implements AppCategories {
  String? id;
  String? title;
  String? categoryIcon;
  List<AppProducts>? products;

  CategoryModel({this.id, this.title, this.categoryIcon, this.products});

  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'categoryIcon': categoryIcon,
      'products': products,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    final rawMap = map['products'] as List;
    final productList = rawMap.map((e) => ProductModel.fromMap(e)).toList();
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      categoryIcon: map['categoryIcon'],
      products: productList,
    );
  }
  static AppCategories toAppCategory(Map<String, dynamic> map) {
    final rawMap = map['products'] as List;
    final productList = rawMap.map((e) => ProductModel.fromMap(e),).toList();
    return AppCategories(
      id: map['id'],
      title: map['title'],
      categoryIcon: map['categoryIcon'],
      products: productList,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

}