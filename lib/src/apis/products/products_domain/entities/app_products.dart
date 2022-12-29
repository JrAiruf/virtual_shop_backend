// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/product_info.dart';
class AppProducts {
  String? id;
  String? title;
  double? price;
  ProductInfo? info;

  AppProducts({this.id, this.price, this.title,this.info});
}