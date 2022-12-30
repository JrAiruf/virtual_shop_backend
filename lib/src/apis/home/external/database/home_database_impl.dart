import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';
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
      final result = await _imagesQuery(
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
  Future<List<HomeImagesModel>>? uploadImages({HomeImagesModel? images}) async {
    final imageMap = images?.toMap();
    imageMap!.remove('id');
    final result = await _imagesQuery(
        'INSERT INTO "HomeImages"(url, position, "xAxis", "yAxis") VALUES (@url, @position, @xAxis, @yAxis) RETURNING id, url, position,"xAxis", "yAxis";',
        variables: imageMap);
    return result!
        .map((item) => HomeImagesModel.fromMap(item["HomeImages"]!))
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



/* 
[
    {
        "id": 1,
        "url": "https://images.pexels.com/photos/2240789/pexels-photo-2240789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "position": 0,
        "xAxis": 2,
        "yAxis": 2
    },
    {
        "id": 6,
        "url": "https://images.pexels.com/photos/1884581/pexels-photo-1884581.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 1,
        "xAxis": 2,
        "yAxis": 1
    },
    {
        "id": 7,
        "url": "https://images.pexels.com/photos/794062/pexels-photo-794062.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 2,
        "xAxis": 1,
        "yAxis": 2
    },
    {
        "id": 8,
        "url": "https://images.pexels.com/photos/1210484/pexels-photo-1210484.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 3,
        "xAxis": 1,
        "yAxis": 1
    },
    {
        "id": 9,
        "url": "https://images.pexels.com/photos/264726/pexels-photo-264726.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 4,
        "xAxis": 1,
        "yAxis": 1
    },
    {
        "id": 10,
        "url": "https://images.pexels.com/photos/1055691/pexels-photo-1055691.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 5,
        "xAxis": 1,
        "yAxis": 2
    },
    {
        "id": 11,
        "url": "https://images.pexels.com/photos/2129970/pexels-photo-2129970.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 6,
        "xAxis": 1,
        "yAxis": 1
    },
    {
        "id": 12,
        "url": "https://images.pexels.com/photos/4641825/pexels-photo-4641825.jpeg?auto=compress&cs=tinysrgb&w=600",
        "position": 8,
        "xAxis": 1,
        "yAxis": 1
    }
]
 */