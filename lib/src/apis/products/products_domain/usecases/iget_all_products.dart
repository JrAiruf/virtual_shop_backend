import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';

abstract class IGetAllProducts {
  Future<List<AppProducts>> getAllProducts();
}
