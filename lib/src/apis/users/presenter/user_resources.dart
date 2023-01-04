import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/users/infra/models/user_model.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_presenter/iuser_presenter.dart';

class UserResources extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/users', _getAllUsers),
        Route.get('/users/:id', _getUserById),
        Route.delete('/users/:id', _deleteUser),
        Route.post('/users', _createUser),
      ];

  FutureOr<Response> _getAllUsers(Injector injector) async {
    final presenter = injector.get<IUserPresenter>();
    return presenter.getAllUsers();
  }

  FutureOr<Response> _getUserById(
      Injector injector, ModularArguments arguments) async {
    final user = AppUserModel.fromMap(arguments.params);
    user.user_id = arguments.params['id'];
    final presenter = injector.get<IUserPresenter>();
    return presenter.getUserById(user: user);
  }

  FutureOr<Response> _createUser(
      Injector injector, ModularArguments arguments) async {
    final user = AppUserModel.fromMap(arguments.data);
    final presenter = injector.get<IUserPresenter>();
    return presenter.createUser(user: user);
  }
  FutureOr<Response> _deleteUser(
      Injector injector, ModularArguments arguments) async {
    final user = AppUserModel.fromMap(arguments.params);
    user.user_id = arguments.params['id'];
    final presenter = injector.get<IUserPresenter>();
    return presenter.deleteUser(user: user);
  }
  
}
