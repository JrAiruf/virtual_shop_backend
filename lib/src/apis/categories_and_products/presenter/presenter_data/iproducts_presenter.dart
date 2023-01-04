import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';

import '../../infra/models/cat_and_prod_model.dart';

abstract class IProductsPresenter {
  FutureOr<Response> getCategories();
  FutureOr<Response> getProducts();
  FutureOr<Response> createCategory({CategoryModel category});
  FutureOr<Response> createProduct({ProductModel product});
  Future<Response>? getCategoryById({CategoryModel category});
  Future<Response>? getProductById({ProductModel product});
  Future<Response>? listCategoryProducts({CategoryModel category});
  Future<Response>? productAndCategoryAssociation({CatAndProd info});
}
