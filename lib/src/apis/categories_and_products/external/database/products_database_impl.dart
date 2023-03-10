// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import '../../../../services/dot_env_service/dot_env_service.dart';
import '../../../errors/categories_and_products.dart';
import '../../infra/data/iproducts_datasource.dart';
import '../../infra/models/cat_and_prod_model.dart';
import '../../utils/database_querys.dart';

class ProductsDatabaseImpl implements IProductsDatasource, Disposable {
  ProductsDatabaseImpl({required this.dotEnv}) {
    _init();
  }

  final DotEnvService dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>>? _productsQuery(
      String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(queryText,
        substitutionValues: variables);
  }

  @override
  Future<List<CategoryModel>>? getCategories() async {
    try {
      final result = await _productsQuery(
        DatabaseQuerys.getCategoriesQuery,
      );
      final categoriesList = result!
          .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
          .toList();
      return categoriesList;
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't access categoires", error: e.toString());
    }
  }

  @override
  Future<List<ProductModel>>? getProducts() async {
    try {
      final result = await _productsQuery(DatabaseQuerys.getProductsQuery);
      final productsList = result!
          .map((item) => ProductModel.fromMap(item["AppProducts"]!))
          .toList();
      return productsList;
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't access products", error: e.toString());
    }
  }

  @override
  Future<List<CategoryModel>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final categoryMap = category?.toMap();
    try {
      final result = await _productsQuery(DatabaseQuerys.createCategoryQuery,
          variables: categoryMap!);
      return result!
          .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
          .toList();
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't create category", error: e.toString());
    }
  }

  @override
  Future<List<ProductModel>>? createProducts({ProductModel? product}) async {
    try {
      final productMap = product?.toMap();
      final result = await _productsQuery(DatabaseQuerys.createProductsQuery,
          variables: productMap!);
      return result!
          .map((item) => ProductModel.fromMap(item["AppProducts"]!))
          .toList();
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't create product", error: e.toString());
    }
  }

  @override
  Future<CategoryModel>? getCategoryById({CategoryModel? category}) async {
    try {
      final result = await _productsQuery(DatabaseQuerys.getCategoryById,
          variables: category!.toMap());
      return result!
          .map((item) => CategoryModel.fromMap(item['AppCategories']!))
          .first;
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't access this category", error: e.toString());
    }
  }

  @override
  Future<ProductModel>? getProductById({ProductModel? product}) async {
    try {
      final result = await _productsQuery(DatabaseQuerys.getProductById,
          variables: product!.toMap());
      return result!
          .map((item) => ProductModel.fromMap(item["AppProducts"]!))
          .first;
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't access this product", error: e.toString());
    }
  }

  @override
  Future<List<ProductModel>>? listCategoryProducts(
      {CategoryModel? category}) async {
    try {
      final result = await _productsQuery(DatabaseQuerys.listProductsByCategory,
          variables: category!.toMap());
      final list = result!.map((item) => item["AppProducts"]).toList();
      return list.map((item) => ProductModel.fromMap(item!)).toList();
    } on Exception catch (e) {
      throw CategoriesProductsError(
          message: "Couldn't to list products", error: e.toString());
    }
  }

  @override
  Future<void> createAssociation({CatAndProd? info}) async {
    await _productsQuery(DatabaseQuerys.associationQuery,
        variables: info!.toMap());
  }

  @override
  void dispose() async {
    final connection = await completer.future;
    await connection.close();
  }

  final completer = Completer<PostgreSQLConnection>();

  _init() async {
    final url = dotEnv['DATABASE_URL']!;
    final uri = Uri.parse(url);
    final userInfo = uri.userInfo.split(':');
    var connection = PostgreSQLConnection(
      uri.host,
      uri.port,
      uri.pathSegments.first,
      username: userInfo[0],
      password: userInfo[1],
    );
    await connection.open();
    completer.complete(connection);
  }
}
