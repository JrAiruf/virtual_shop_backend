import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

abstract class IProductsRepository {
  Future<List<AppProducts>> getAllProducts();
}
