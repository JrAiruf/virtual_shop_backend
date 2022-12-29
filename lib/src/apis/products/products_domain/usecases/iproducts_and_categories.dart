import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../infra/models/category_model.dart';
import '../../infra/models/product_model.dart';
import '../entities/app_categories.dart';

abstract class IProductsAndCategories {
  Future<List<AppProducts>>? getProducts();
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<List<AppCategories>>? getCategories();
  Future<List<AppCategories>>? createCategories({CategoryModel category});
}
