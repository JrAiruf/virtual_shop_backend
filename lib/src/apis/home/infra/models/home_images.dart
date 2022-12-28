// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';
import '../../home_domain/entities/home_images.dart';

class HomeImagesModel extends HomeImages {
  String? url;
  int? position;
  int? xAxis;
  int? yAxis;

  HomeImagesModel({this.url, this.position, this.xAxis, this.yAxis}) : super('', 0, 0, 0);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'position': position,
      'xAxis': xAxis,
      'yAxis': yAxis,
    };
  }

  factory HomeImagesModel.fromMap(Map<String, dynamic> map) {
    return HomeImagesModel(
      url: map['url'],
      position: map['position'],
      xAxis: map['xAxis'],
      yAxis: map['yAxis'],
    );
  }

  static HomeImages toHomeImages(Map<String, dynamic> raw) => HomeImages(
        raw['url'],
        raw['position'],
        raw['xAxis'],
        raw['yAxis'],
      );

  String toJson() => json.encode(toMap());

  factory HomeImagesModel.fromJson(String source) =>
      HomeImagesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
