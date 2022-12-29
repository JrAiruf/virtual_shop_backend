import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';

abstract class IProductsDatasource {
  Future<List<ProductModel>>? getProducts();
  Future<List<ProductModel>>? createProducts({ProductModel product});
  Future<List<CategoryModel>>? getCategories();
  Future<List<CategoryModel>>? createCategories({CategoryModel category});
}
