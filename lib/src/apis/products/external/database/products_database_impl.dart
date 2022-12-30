// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import '../../../../services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iproducts_datasource.dart';

class ProductsDatabaseImpl implements IProductsDatasource, Disposable {
  ProductsDatabaseImpl({required this.dotEnv}) {
    _init();
  }

  final DotEnvService dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>>? _productsQuery(
      String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  Future<List<CategoryModel>>? getCategories() async {
    final list = <CategoryModel>[];
    try {
      final result = await _productsQuery(
        '',
      );
      return list;
    } on Exception catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<ProductModel>>? getProducts() async {
    final list = <ProductModel>[];
    try {
      final result = await _productsQuery('');
      return list;
    } on Exception catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<CategoryModel>>? createCategories(
      {CategoryModel? category}) async {
    final categoryMap = category?.toMap();
    final result = await _productsQuery(
      'INSERT INTO "AppCategories"("categoryid","title", "iconImage", "products")VALUES (@categoryid, @title, @iconImage, @products) RETURNING categoryid, title, iconImage @products;',
      variables: categoryMap!,
    );
    return result!
        .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
        .toList();
  }

  @override
  Future<List<ProductModel>>? createProducts({ProductModel? product}) async {
    final productMap = product?.toMap();
    productMap!.remove('category');
    final result = await _productsQuery(
      'INSERT INTO "AppProducts"("productid", "title", "price", "description", "images", "size")VALUES (@productid, @title, @price, @description, @images, @size) RETURNING productid, title, price, description, images, size;',
      variables: productMap,
    );
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
}
