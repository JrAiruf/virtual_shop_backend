// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import 'package:virtual_shop_backend/src/apis/users/utils/user_database_querys.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';
import '../infra/data/iapp_user_datasource.dart';

class AppUserDatabase implements IAppUserDatasource, Disposable {
  AppUserDatabase({required DotEnvService dotEnvService})
      : _dotEnvService = dotEnvService {
    _init();
  }

  final DotEnvService _dotEnvService;

  Future<List<Map<String, Map<String, dynamic>>>>? _userQuery(String queryText,
      {Map<String, dynamic> variables = const {}}) async {
    final connection = await completer.future;
    return await connection.mappedResultsQuery(
      queryText,
      substitutionValues: variables,
    );
  }

  @override
  Future<List<AppUserModel>>? getAllUsers() async {
    final result = await _userQuery(UserDatabaseQuerys.getAllUsers);
    final list =
        result!.map((item) => AppUserModel.fromMap(item["AppUser"]!)).toList();
    return list;
  }

  @override
  Future<AppUserModel>? getUserById({AppUserModel? user}) async {
    final result = await _userQuery(UserDatabaseQuerys.getUserById,
        variables: user!.toMap());
    return result!.map((item) => AppUserModel.fromMap(item["AppUser"]!)).first;
  }

  @override
  Future<AppUserModel>? createUser({AppUserModel? user}) async {
    final result = await _userQuery(UserDatabaseQuerys.createUser,
        variables: user!.toMap());
    return result!.map((item) => AppUserModel.fromMap(item["AppUser"]!)).first;
  }

  @override
  Future<void>? deleteUser({AppUserModel? user}) async {
    await _userQuery(UserDatabaseQuerys.deleteUser, variables: user!.toMap());
  }

  @override
  Future<void>? signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void>? signOut() {
     throw UnimplementedError();
  }

  @override
  void dispose() async {
    final connection = await completer.future;
    await connection.close();
  }

  final completer = Completer<PostgreSQLConnection>();

  _init() async {
    final url = _dotEnvService['DATABASE_URL']!;
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
