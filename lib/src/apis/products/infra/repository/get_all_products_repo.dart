// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../products_domain/products_repository/iproducts_repository.dart';
import '../data/iproducts_datasource.dart';

class GetAllProductsRepo implements IProductsRepository {
  GetAllProductsRepo({required this.datasource});
  final IProductsDatasource datasource;

  @override
  Future<List<AppProducts>> getAllProducts() async {
    final list = await datasource.getAllProducts();
    return list!.map((item) => ProductModel.toAppProduct(item.toMap())).toList();
  }
}
