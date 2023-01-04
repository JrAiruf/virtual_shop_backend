// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/entities/app_user_entity.dart';
import '../../users_domain/users_repository/iapp_user_repo.dart';
import '../data/iapp_user_datasource.dart';

class AppUserUsecasesImpl implements IAppUserRepo {
  AppUserUsecasesImpl({required this.datasource});

  final IAppUserDatasource datasource;

  @override
  Future<List<AppUserEntity>>? getAllUsers() async {
    try {
      final result = await datasource.getAllUsers();
      return result!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserEntity>? getUserById({AppUserModel? user}) async {
    try {
      final result = await datasource.getUserById(user: user!);
      return result!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserEntity>? createUser({AppUserModel? user}) async {
    try {
      final result = await datasource.createUser(user: user!);
      return result!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void>? deleteUser({AppUserModel? user}) async {
    await datasource.deleteUser(user: user!);
  }

  @override
  Future<void>? signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void>? signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
