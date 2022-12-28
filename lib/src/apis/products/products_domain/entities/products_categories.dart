// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

class ProductsCategories {
  String? id;
  String? title;
  String? categoryIcon;
  List<AppProducts>? products;

  ProductsCategories({this.id, this.title, this.categoryIcon, this.products});
}
