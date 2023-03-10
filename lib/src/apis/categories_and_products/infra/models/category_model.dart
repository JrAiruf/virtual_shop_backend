// ignore_for_file: annotate_overrides
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';

class CategoryModel implements AppCategories {
  String? categoryid;
  String? title;
  String? iconimage;

  CategoryModel({this.categoryid, this.title, this.iconimage,});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryid': categoryid,
      'title': title,
      'iconimage': iconimage,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryid: map['categoryid'] != null ? map['categoryid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      iconimage: map['iconimage'],
    );
  }
  static AppCategories toAppCategory({CategoryModel? category}) {
    return AppCategories(
      categoryid: category!.categoryid,
      title: category.title,
      iconimage: category.iconimage,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
