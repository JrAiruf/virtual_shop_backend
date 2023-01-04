import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import '../entities/app_user_entity.dart';

abstract class IAppUserUsecases {
  Future<List<AppUserEntity>>? getAllUsers();
  Future<AppUserEntity>? createUser({AppUserModel user});
  Future<AppUserEntity>? getUserById({AppUserModel user});
  Future<void>? deleteUser({AppUserModel user});
}