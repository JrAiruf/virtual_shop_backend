import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';
import '../../infra/models/cat_and_prod_model.dart';
import '../../infra/models/category_model.dart';
import '../../infra/models/product_model.dart';
import '../entities/app_categories.dart';

abstract class IProductsAndCategories {
  Future<List<AppCategories>>? getCategories();
  Future<List<AppProducts>>? getProducts();
  Future<List<ProductModel>>? listCategoryProducts( {CategoryModel category});
  Future<List<AppCategories>>? createCategories( {CategoryModel category});
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<void> productAndCategoryAssociation({CatAndProd info});
  Future<AppCategories>? getCategoryById({required String categoryId});
}
