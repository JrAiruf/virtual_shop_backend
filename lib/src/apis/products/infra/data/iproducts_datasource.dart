import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';

import '../models/cat_and_prod_model.dart';

abstract class IProductsDatasource {
  Future<List<CategoryModel>>? getCategories();
  Future<List<ProductModel>>? getProducts();
  Future<List<CategoryModel>>? createCategories({CategoryModel category});
  Future<List<ProductModel>>? createProducts({ProductModel product});
  Future<CategoryModel>? getCategoryById({required String categoryId});
  Future<ProductModel>? getProductById({ProductModel product});
  Future<void> productAndCategoryAssociation({CatAndProd info});
}
