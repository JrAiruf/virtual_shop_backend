// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/products_domain/entities/app_products.dart';
import '../products_repository/iproducts_repository.dart';
import 'iproducts_and_categories.dart';

class ProductsAndCategoriesImpl implements IProductsAndCategories {
  ProductsAndCategoriesImpl({required this.repository});
  final IProductsRepository repository;

  @override
  Future<List<AppCategories>>? createCategories(
       {CategoryModel? category, ProductModel? product}) async {
    final result = await repository.createCategories(category: category!,product: product!);
    return result!;
  }

  @override
  Future<List<AppProducts>>? createProducts({ProductModel? product}) async {
    final result = await repository.createProducts(product: product!);
    return result!;
  }

  @override
  Future<List<AppCategories>>? getCategories() async {
    final result = await repository.getCategories();
    return result!;
  }

  @override
  Future<List<AppProducts>>? getProducts() async {
      final result = await repository.getProducts();
    return result!;
  }
}
