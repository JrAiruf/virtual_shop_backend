import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import '../../products_domain/entities/app_products.dart';

class CategoryModel {
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
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      categoryIcon: map['categoryIcon'],
      products: map['products'],
    );
  }
  static AppCategories toAppCategory(Map<String, dynamic> map) {
    return AppCategories(
      id: map['id'],
      title: map['title'],
      categoryIcon: map['categoryIcon'],
      products: map['products'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

}