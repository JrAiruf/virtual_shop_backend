// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import '../../../../services/dot_env_service/dot_env_service.dart';
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
    try {
      final connection = await completer.future;
      return await connection.mappedResultsQuery(queryText,
          substitutionValues: variables);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PostgreSQLResult>? _singleItemQuery(String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    try {
      final connection = await completer.future;
      return connection.query(queryText, substitutionValues: variables);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
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
  Future<List<ProductModel>>? listCategoryProducts(
      {CategoryModel? category}) async {
    final result = await _productsQuery(DatabaseQuerys.listProductsByCategory,
        variables: category!.toMap());
    final list = result!.map((item) => item["AppProducts"]).toList();
    return list.map((item) => ProductModel.fromMap(item!)).toList();
  }

  @override
  Future<List<CategoryModel>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final categoryMap = category?.toMap();
    final bipbip = await listCategoryProducts(category: category);
    try {
      final result = await _productsQuery(DatabaseQuerys.createCategoryQuery,
          variables: categoryMap!);
      return result!
          .map((item) => CategoryModel.fromMap(item["AppCategories"]!))
          .toList();
    } on Exception catch (e) {
      throw Exception(e.toString());
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<CategoryModel>? getCategoryById({required String categoryId}) async {
    final variable = {'categoryid': categoryId};
    final result = await _productsQuery(DatabaseQuerys.getCategoryById,
        variables: variable);
    final categoryData = result!.map((e) => e['AppCategories']).toList();
    final productList =
        categoryData.map((e) => CategoryModel.fromMap(e!)).toList();
    final category = productList.first;
    final categoryMap = {
      'categoryid': category.categoryid,
      'title': category.title,
      'iconimage': category.iconimage,
    };
    return CategoryModel.fromMap(categoryMap);
  }

  @override
  Future<ProductModel>? getProductById({ProductModel? product}) async {
    try {
      final result = await _singleItemQuery(
        DatabaseQuerys.getProductById,
      );
      final product = result!.map((item) => item).toList();
      return ProductModel();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> productAndCategoryAssociation({CatAndProd? info}) async {
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
