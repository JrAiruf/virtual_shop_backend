// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import '../../../../services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iproducts_datasource.dart';
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

  Future<PostgreSQLResult>? _singleItemQuery(String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return connection.query(queryText);
  }

  @override
  Future<List<CategoryModel>>? getCategories() async {
    try {
      final result = await _productsQuery(DatabaseQuerys.getCategoriesQuery);
      final categoriesList = result!
          .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
          .toList();
      return categoriesList;
    } on Exception catch (e) {
      throw Exception(e.toString());
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final categoryMap = category?.toMap();
    final result = await _productsQuery(DatabaseQuerys.createCategoryQuery,
        variables: categoryMap!);
    return result!
        .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
        .toList();
  }

  @override
  Future<List<ProductModel>>? createProducts({ProductModel? product}) async {
    final productMap = product?.toMap();
    final result = await _productsQuery(DatabaseQuerys.createProductsQuery,
        variables: productMap!);
    return result!
        .map((item) => ProductModel.fromMap(item["AppProducts"]!))
        .toList();
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

  @override
  Future<ProductModel>? getProductById({ProductModel? product}) async {
    final result = await _singleItemQuery(
      DatabaseQuerys.getProductById,
    );
    final product = result!.map((item) => item).toList();
    return ProductModel();
  }
}
