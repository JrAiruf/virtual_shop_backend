// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/usecases/iget_all_products.dart';

import '../products_repository/iproducts_repository.dart';

class GetAllProductsImpl implements IGetAllProducts {
  GetAllProductsImpl({required this.repository});
  final IProductsRepository repository;
  
  @override
  Future<List<AppProducts>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
