import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';

abstract class IProductsPresenter {
  FutureOr<Response> getProducts();
  FutureOr<Response> getCategories();
  FutureOr<Response> createProduct({ProductModel product});
  FutureOr<Response> createCategory({CategoryModel category, ProductModel product});
}
