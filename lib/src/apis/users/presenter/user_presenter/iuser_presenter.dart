import 'package:shelf/shelf.dart';

import '../../infra/models/user_model.dart';

abstract class IUserPresenter {
  Future<Response> getAllUsers();
  Future<Response> createUser({AppUserModel user});
  Future<Response> getUserById({AppUserModel user});
  Future<Response> deleteUser({AppUserModel user});
}
