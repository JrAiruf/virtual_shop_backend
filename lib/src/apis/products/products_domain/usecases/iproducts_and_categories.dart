import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../infra/models/cat_and_prod_model.dart';
import '../../infra/models/category_model.dart';
import '../../infra/models/product_model.dart';
import '../entities/app_categories.dart';

abstract class IProductsAndCategories {
  Future<List<AppCategories>>? getCategories();
  Future<List<AppProducts>>? getProducts();
  Future<List<AppCategories>>? createCategories( {CategoryModel category});
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<void> productAndCategoryAssociation({CatAndProd info});
  Future<CategoryModel>? getCategoryById({required String categoryId});
}
