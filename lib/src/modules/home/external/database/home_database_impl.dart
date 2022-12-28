import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/modules/home/infra/models/home_images.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iget_home_images_datasource.dart';

class HomeDatabaseImpl implements IGetHomeImagesDatasource, Disposable {
  HomeDatabaseImpl({required this.dotEnv}) {
    _init();
  }

  final DotEnvService dotEnv;

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

  Future<List<Map<String, Map<String, dynamic>>>>? _query(String queryText,
      {Map<String, String> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  Future<List<HomeImagesModel>>? getHomeImages() async {
    try {
      final result = await _query(
        'SELECT id, url, "position", "xAxis", "yAxis" FROM "HomeImages";',
      );
      final imagesList = result
          ?.map((item) => HomeImagesModel.fromMap(item['HomeImages']!))
          .toList();
      return imagesList!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void dispose() async {
    final connection = await completer.future;
    await connection.close();
  }
}
