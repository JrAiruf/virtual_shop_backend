// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/cat_and_prod_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';
import '../../products_domain/products_repository/iproducts_repository.dart';
import '../data/iproducts_datasource.dart';

class GetAllProductsRepo implements IProductsRepository {
  GetAllProductsRepo({required this.datasource});
  final IProductsDatasource datasource;

  @override
  Future<List<AppCategories>>? getCategories() async {
    final list = await datasource.getCategories();
    return list!
        .map((item) => CategoryModel.toAppCategory(category: item))
        .toList();
  }

  @override
  Future<List<AppProducts>> getProducts() async {
    final list = await datasource.getProducts();
    return list!
        .map((item) => ProductModel.toAppProduct(product: item))
        .toList();
  }


  @override
  Future<List<ProductModel>>? listCategoryProducts(
      {CategoryModel? category}) async {
    final result = await datasource.listCategoryProducts(category: category!);
    return result!;
  }

  @override
  Future<List<AppCategories>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final list = await datasource.createCategories(category: category!);
    return list!
        .map((item) => CategoryModel.toAppCategory(category: category))
        .toList();
  }

  @override
  Future<List<AppProducts>>? createProducts({ProductModel? product}) async {
    final list = await datasource.createProducts(product: product!);
    return list!
        .map((item) => ProductModel.toAppProduct(product: product))
        .toList();
  }

  @override
  Future<CategoryModel>? getCategoryById({required String categoryId}) async {
    final result = await datasource.getCategoryById(categoryId: categoryId);
    return result!;
  }

  @override
  Future<void> productAndCategoryAssociation({CatAndProd? info}) async {
    await datasource.productAndCategoryAssociation(info: info!);
  }

}