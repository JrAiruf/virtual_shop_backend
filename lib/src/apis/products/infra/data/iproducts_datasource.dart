import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';

abstract class IProductsDatasource {
  Future<List<ProductModel>>? getAllProducts();
}
