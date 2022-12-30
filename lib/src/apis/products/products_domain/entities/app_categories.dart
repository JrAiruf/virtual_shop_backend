// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

class AppCategories {
  String? categoryid;
  String? title;
  String? iconimage;
  List<AppProducts>? products;

  AppCategories({this.categoryid, this.title, this.iconimage, this.products});
}
