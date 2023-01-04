import 'package:virtual_shop_backend/src/apis/errors/home.dart';

class CategoriesProductsError extends ApplicationErrors {
  CategoriesProductsError({this.error, this.message});
  final String? error;
  final String? message;
}
