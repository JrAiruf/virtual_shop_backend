import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';

abstract class IAppUserDatasource {
  Future<List<AppUserModel>>? getAllUsers();
  Future<AppUserModel>? createUser({AppUserModel user});
  Future<AppUserModel>? getUserById({AppUserModel user});
  Future<void>? signIn();
  Future<void>? signOut();
  Future<void>? deleteUser({AppUserModel user});
}