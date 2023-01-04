import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';

import '../models/cat_and_prod_model.dart';

abstract class IProductsDatasource {
  Future<List<CategoryModel>>? getCategories();
  Future<List<ProductModel>>? getProducts();
  Future<List<CategoryModel>>? createCategories({CategoryModel category});
  Future<List<ProductModel>>? createProducts({ProductModel product});
  Future<CategoryModel>? getCategoryById({CategoryModel category});
  Future<ProductModel>? getProductById({ProductModel product});
  Future<List<ProductModel>>? listCategoryProducts( {CategoryModel category});
  Future<CatAndProd> createAssociation({CatAndProd info});
  
}
