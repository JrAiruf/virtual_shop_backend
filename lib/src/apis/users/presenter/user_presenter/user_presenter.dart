// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_presenter/iuser_presenter.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/usecases/iapp_user.dart';

import '../../infra/models/user_model.dart';

class UserPresenter implements IUserPresenter {
  UserPresenter({required this.usecase});
  final IAppUserUsecases usecase;

  @override
  Future<Response> getAllUsers() async {
    final result = await usecase.getAllUsers();
    final body = result!
        .map(
          (item) => {
            'user_id': item.user_id,
            'name': item.name,
            'email': item.email,
            'city': item.city,
          },
        )
        .toList();
    return Response(
      200,
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response> getUserById({AppUserModel? user}) async {
    final result = await usecase.getUserById(user: user!);
    final body = {
      'user_id': result!.user_id,
      'name': result.name,
      'email': result.email,
      'city': result.city,
    };

    return Response(
      200,
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response> createUser({AppUserModel? user}) async {
    final appUser = await usecase.createUser(user: user!);
    final body = {
      'user_id': appUser!.user_id,
      'name': appUser.name,
      'email': appUser.email,
      'password': appUser.password,
      'city': appUser.city,
    };
    return Response(
      200,
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response> deleteUser({AppUserModel? user}) async {
    await usecase.deleteUser(user: user!);
    final body = {
        'message': 'User Deleted: ${user.user_id}',
      };
    return Response(
      200,
      body: jsonEncode(body),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Response> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
