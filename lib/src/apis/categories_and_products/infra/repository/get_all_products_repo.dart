// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/cat_and_prod_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';
import 'package:virtual_shop_backend/src/apis/errors/categories_and_products.dart';
import '../../products_domain/products_repository/iproducts_repository.dart';
import '../data/iproducts_datasource.dart';

class GetAllProductsRepo implements IProductsRepository {
  GetAllProductsRepo({required this.datasource});
  final IProductsDatasource datasource;

  @override
  Future<List<AppCategories>>? getCategories() async {
    final list = await datasource.getCategories();
    if (list != null && list.isNotEmpty) {
      return list
          .map((item) => CategoryModel.toAppCategory(category: item))
          .toList();
    }
    throw CategoriesProductsError(message: "Couldn't get categories");
  }

  @override
  Future<List<AppProducts>> getProducts() async {
    final list = await datasource.getProducts();
    if (list != null && list.isNotEmpty) {
      return list
          .map((item) => ProductModel.toAppProduct(product: item))
          .toList();
    }
    throw CategoriesProductsError(message: "Couldn't get products");
  }

  @override
  Future<List<ProductModel>>? listCategoryProducts(
      {CategoryModel? category}) async {
    final result = await datasource.listCategoryProducts(category: category!);
    if (result != null && result.isNotEmpty) {
      return result;
    }
    throw CategoriesProductsError(
        message: "Couldn't to list category products");
  }

  @override
  Future<List<AppCategories>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final list = await datasource.createCategories(category: category!);
    if (list != null && list.isNotEmpty) {
      return list
          .map((item) => CategoryModel.toAppCategory(category: category))
          .toList();
    }
    throw CategoriesProductsError(message: "Couldn't create category");
  }

  @override
  Future<List<AppProducts>>? createProducts({ProductModel? product}) async {
    final list = await datasource.createProducts(product: product!);
    if (list != null && list.isNotEmpty) {
      return list
          .map((item) => ProductModel.toAppProduct(product: product))
          .toList();
    }
    throw CategoriesProductsError(message: "Couldn't create product");
  }

  @override
  Future<CategoryModel>? getCategoryById({CategoryModel? category}) async {
    final result = await datasource.getCategoryById(category: category!);
    if (result != null) {
      return result;
    }
    throw CategoriesProductsError(message: "Couldn't access category");
  }

  @override
  Future<ProductModel>? getProductById({ProductModel? product}) async {
    final result = await datasource.getProductById(product: product!);
    if (result != null) {
      return result;
    }
    throw CategoriesProductsError(message: "Couldn't access product");
  }

  @override
  Future<void> createAssociation({CatAndProd? info}) async {
      await datasource.createAssociation(info: info!);
  }
}
