// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_presenter/iuser_presenter.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_presenter/module_responses.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/usecases/iapp_user.dart';

import '../../infra/models/user_model.dart';

class UserPresenter implements IUserPresenter {
  UserPresenter({required this.usecase});
  final IAppUserUsecases usecase;

  @override
  Future<Response> getAllUsers() async {
    final result = await usecase.getAllUsers();
    return ModuleResponses.getAllUsers(list: result!);
  }

  @override
  Future<Response> getUserById({AppUserModel? user}) async {
    final result = await usecase.getUserById(user: user!);
    return ModuleResponses.getUserById(user: result);
  }

  @override
  Future<Response> createUser({AppUserModel? user}) async {
    final appUser = await usecase.createUser(user: user!);
    return ModuleResponses.createUser(user: appUser);
  }

  @override
  Future<Response> deleteUser({AppUserModel? user}) async {
    await usecase.deleteUser(user: user!);
    return ModuleResponses.deleteUser(user: user);
  }
}
