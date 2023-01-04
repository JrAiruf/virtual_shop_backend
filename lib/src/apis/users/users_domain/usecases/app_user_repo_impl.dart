// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/entities/app_user_entity.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/usecases/iapp_user.dart';
import '../users_repository/iapp_user_repo.dart';

class AppUserRepoImpl implements IAppUserUsecases {
  AppUserRepoImpl({required this.repository});

  final IAppUserRepo repository;

  @override
  Future<List<AppUserEntity>>? getAllUsers() async {
    final result = await repository.getAllUsers();
    return result!;
  }

  @override
  Future<AppUserEntity>? getUserById({AppUserModel? user}) async {
    final result = await repository.getUserById(user: user!);
    return result!;
  }

  @override
  Future<AppUserEntity>? createUser({AppUserModel? user}) async {
    final result = await repository.createUser(user: user!);
    final appuser = AppUserModel.fromAppUserEntity(user: result!);
    return appuser;
  }

  @override
  Future<void>? deleteUser({AppUserModel? user}) async {
    await repository.deleteUser(user: user!);
  }
}
