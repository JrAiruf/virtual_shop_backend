import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

abstract class IProductsRepository {
  Future<List<AppProducts>>? getProducts();
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<List<AppCategories>>? getCategories();
  Future<CategoryModel>? getCategoryById({required String categoryId});
  Future<void>? addProductToCategory({String categoryId, ProductModel product});
  Future<List<AppCategories>>? createCategories({CategoryModel category, ProductModel product});
}
