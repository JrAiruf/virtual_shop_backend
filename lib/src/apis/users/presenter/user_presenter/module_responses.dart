import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/users/users_domain/entities/app_user_entity.dart';

class ModuleResponses {
  static Future<Response> getAllUsers({List<AppUserEntity>? list}) async {
    if (list != null && list.isNotEmpty) {
      final body = list
          .map(
            (item) => {
              'user_id': item.user_id,
              'name': item.name,
              'email': item.email,
              'city': item.city,
            },
          )
          .toList();
      return Response(200, body: jsonEncode(body), headers: {
        'content-type': 'application/json',
      });
    }
    return Response(
      404,
      body: jsonEncode(
        {'erro': 'Users not found'},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  static Future<Response> getUserById({AppUserEntity? user}) async {
    if (user != null && user.user_id!.isNotEmpty) {
      final body = {
        'user_id': user.user_id,
        'name': user.name,
        'email': user.email,
        'city': user.city
      };
      return Response(200, body: jsonEncode(body), headers: {
        'content-type': 'application/json',
      });
    }
    return Response(
      404,
      body: jsonEncode(
        {'erro': 'User not found'},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  static Future<Response> createUser({AppUserEntity? user}) async {
    if (user != null) {
      final body = {
        'user_id': user.user_id,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'city': user.city,
      };
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode({'message': 'User not created'}),
      headers: {'content-type': 'application/json'},
    );
  }

  static Future<Response> deleteUser({AppUserEntity? user}) async {
    if (user != null) {
      final body = {
        'message': 'User Deleted: ${user.user_id}',
      };
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode({'message': "User doesn't exist"}),
      headers: {'content-type': 'application/json'},
    );
  }
}
