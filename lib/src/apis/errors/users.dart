import 'package:virtual_shop_backend/src/apis/errors/home.dart';

class UserError extends ApplicationErrors {
  UserError({this.error, this.message});
  final String? error;
  final String? message;
}