// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';

import '../../../../services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iproducts_datasource.dart';

class ProductsDatabaseImpl implements IProductsDatasource {
  ProductsDatabaseImpl({required this.dotEnv});
  final DotEnvService dotEnv;
  @override
  Future<List<ProductModel>>? getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
