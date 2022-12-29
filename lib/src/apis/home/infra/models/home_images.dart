// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';

import '../../home_domain/entities/home_images.dart';

class HomeImagesModel implements HomeImages {
  int? id;
  String? url;
  int? position;
  int? xAxis;
  int? yAxis;

  HomeImagesModel({this.id, this.url, this.position, this.xAxis, this.yAxis});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'position': position,
      'xAxis': xAxis,
      'yAxis': yAxis,
    };
  }

  factory HomeImagesModel.fromMap(Map<String, dynamic> map) {
    return HomeImagesModel(
      id: map['id'] != null ? map['id'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      position: map['position'] != null ? map['position'] as int : null,
      xAxis: map['xAxis'] != null ? map['xAxis'] as int : null,
      yAxis: map['yAxis'] != null ? map['yAxis'] as int : null,
    );
  }

  static HomeImages toHomeImages(Map<String, dynamic> raw) => HomeImages(
        raw['id'],
        raw['url'],
        raw['position'],
        raw['xAxis'],
        raw['yAxis'],
      );

  String toJson() => json.encode(toMap());

  factory HomeImagesModel.fromJson(String source) =>
      HomeImagesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
