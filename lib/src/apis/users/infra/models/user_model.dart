// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: annotate_overrides
import 'dart:convert';
import 'package:virtual_shop_backend/src/apis/users/users_domain/entities/app_user_entity.dart';

class AppUserModel implements AppUserEntity {
  String? user_id;
  String? city;
  String? name;
  String? email;
  String? password;

  AppUserModel({this.user_id, this.city, this.name, this.email, this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': user_id,
      'city': city,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
  static fromAppUserEntity({AppUserEntity? user}) {
    return AppUserModel(
      user_id: user!.user_id,
      name: user.name,
      password: user.password,
      city: user.city,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
