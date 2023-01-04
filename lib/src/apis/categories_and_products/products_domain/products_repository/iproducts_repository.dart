import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';
import '../../infra/models/cat_and_prod_model.dart';

abstract class IProductsRepository {
  Future<List<AppCategories>>? getCategories();
  Future<List<AppProducts>>? getProducts();
  Future<List<AppCategories>>? createCategories({CategoryModel category});
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<CategoryModel>? getCategoryById({CategoryModel category});
  Future<ProductModel>? getProductById({ProductModel product});
  Future<List<ProductModel>>? listCategoryProducts({CategoryModel category});
  Future<void> createAssociation({CatAndProd info});
    
}
