// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/errors/users.dart';
import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/entities/app_user_entity.dart';
import '../../users_domain/users_repository/iapp_user_repo.dart';
import '../data/iapp_user_datasource.dart';

class AppUserUsecasesImpl implements IAppUserRepo {
  AppUserUsecasesImpl({required this.datasource});

  final IAppUserDatasource datasource;

  @override
  Future<List<AppUserEntity>>? getAllUsers() async {
    final result = await datasource.getAllUsers();
    if (result != null && result.isNotEmpty) {
      return result;
    }
    throw UserError(message: "Coudn't get users");
  }

  @override
  Future<AppUserEntity>? getUserById({AppUserModel? user}) async {
    if (user != null) {
      final result = await datasource.getUserById(user: user);
      return result!;
    }
    throw UserError(message: "Invalid user");
  }

  @override
  Future<AppUserEntity>? createUser({AppUserModel? user}) async {
    if (user != null) {
      final result = await datasource.createUser(user: user);
      return result!;
    }
    throw UserError(message: "Unabled to create User");
  }

  @override
  Future<void>? deleteUser({AppUserModel? user}) async {
    if (user != null) {
  await datasource.deleteUser(user: user);
}
  }
}
