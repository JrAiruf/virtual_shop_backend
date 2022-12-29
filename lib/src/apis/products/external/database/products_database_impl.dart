// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import '../../../../services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iproducts_datasource.dart';

class ProductsDatabaseImpl implements IProductsDatasource {
  ProductsDatabaseImpl({required this.dotEnv});

  final DotEnvService dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>>? _query(String queryText,
      {Map<String, String> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  Future<List<ProductModel>>? getAllProducts() async {
    final list = <ProductModel>[];
    try {
  final result = await _query('');
  return list;
} on Exception catch (e) {
 throw Exception() ;
}
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
