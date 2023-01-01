import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../infra/models/cat_and_prod_model.dart';

abstract class IProductsRepository {
  Future<List<AppCategories>>? getCategories();
  Future<List<AppProducts>>? getProducts();
  Future<List<AppCategories>>? createCategories({CategoryModel category});
  Future<List<AppProducts>>? createProducts({ProductModel product});
  Future<CategoryModel>? getCategoryById({required String categoryId});
  Future<void> productAndCategoryAssociation({CatAndProd info});
}
