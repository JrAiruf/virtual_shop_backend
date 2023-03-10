import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/errors/home.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/utils/home_database_querys.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';
import '../../infra/data/iget_home_images_datasource.dart';

class HomeDatabaseImpl implements IGetHomeImagesDatasource, Disposable {
  HomeDatabaseImpl({required this.dotEnv}) {
    _init();
  }

  final DotEnvService dotEnv;

  Future<List<Map<String, Map<String, dynamic>>>>? _imagesQuery(
      String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  Future<List<HomeImagesModel>>? getHomeImages() async {
    try {
      final result = await _imagesQuery(HomeDatabaseQuerys.getImagesQuery);
      final imagesList = result
          ?.map((item) => HomeImagesModel.fromMap(item['HomeImages']!))
          .toList();
      return imagesList!;
    } on Exception catch (e) {
      throw HomeErrors(message: "Could'not download images",error: e.toString());
    }
  }

  @override
  Future<void>? uploadImages({HomeImagesModel? images}) async {
    final imageMap = images?.toMap();
    try {
      await _imagesQuery(
        HomeDatabaseQuerys.uploadImageQuery,
        variables: imageMap!,
      );
    } on Exception catch (e) {
      throw HomeErrors(message: "Could'not Upload image",error: e.toString());
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
