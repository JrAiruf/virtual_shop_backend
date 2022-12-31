// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../../products_domain/products_repository/iproducts_repository.dart';
import '../data/iproducts_datasource.dart';

class GetAllProductsRepo implements IProductsRepository {
  GetAllProductsRepo({required this.datasource});
  final IProductsDatasource datasource;

  @override
  Future<List<AppProducts>> getProducts() async {
    final list = await datasource.getProducts();
    return list!.map((item) => ProductModel.toAppProduct(product: item)).toList();
  }

  @override
  Future<List<AppCategories>>? getCategories() async {
    final list = await datasource.getCategories();
    return list!.map((item) => CategoryModel.toAppCategory(category: item)).toList();
  }

  @override
  Future<List<AppCategories>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final list = await datasource.createCategories(category: category!, product: product!);
    return list!.map((item) => CategoryModel.toAppCategory(category: category)).toList();
    
  }

  @override
  Future<List<AppProducts>>? createProducts({ProductModel? product}) async {
    final list = await datasource.createProducts(product: product!);
  return list!.map((item) => ProductModel.toAppProduct(product: product)).toList();
  
  }
}
