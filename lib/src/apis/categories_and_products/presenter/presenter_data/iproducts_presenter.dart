import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';

import '../../infra/models/cat_and_prod_model.dart';

abstract class IProductsPresenter {
  FutureOr<Response> getCategories();
  FutureOr<Response> getProducts();
  Future<Response>? listCategoryProducts({CategoryModel category});
  FutureOr<Response> createCategory({CategoryModel category});
  FutureOr<Response> createProduct({ProductModel product});
  Future<Response>? getCategoryById({required String categoryId});
  Future<Response>? productAndCategoryAssociation({CatAndProd info});
}
