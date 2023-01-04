import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../home_domain/entities/home_images.dart';
import '../../infra/models/home_images.dart';

abstract class HomeModule {
 static Future<Response> getImagesResponse({
    required List<HomeImages> body,
  }) async {
    if (body.isNotEmpty) {
      final list = body
          .map(
            (item) => {
              'id': item.id,
              'url': item.url,
              'position': item.position,
              'xAxis': item.xAxis,
              'yAxis': item.yAxis,
            },
          )
          .toList();
      return Response(
        200,
        body: jsonEncode(list),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      404,
      body: {'message': 'Fail obtaining images!'},
      headers: {'content-type': 'application/json'},
    );
  }

 static Future<Response> uploadImagesResponse({
    HomeImagesModel? body,
  }) async {
    if (body != null && body.url!.isNotEmpty) {
      return Response(200,
          body: jsonEncode({'message': 'Image Uploaded!'}),
          headers: {'content-type': 'application/json'});
    }
    return Response(
      404,
      body: {'message': 'Fail uploading images!'},
      headers: {'content-type': 'application/json'},
    );
  }
}