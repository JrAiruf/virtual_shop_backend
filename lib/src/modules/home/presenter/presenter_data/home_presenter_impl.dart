// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/modules/home/home_domain/usecases/iget_home_images.dart';
import 'package:virtual_shop_backend/src/modules/home/presenter/presenter_data/ihome_presenter.dart';

class HomePresenterImpl extends Module implements IHomePresenter {
  HomePresenterImpl({required this.presenter});
  IGetHomeImages presenter;

  @override
  FutureOr<Response> getHomeImages() async {
    final result = await presenter.getHomeImages();
    final body = result!.map((item) => {
      'url': item.imageUrl,
      'position': item.pos,
      'xAxis': item.x,
      'yAxis': item.y,
    }).toList();
    final imagesList = jsonEncode(body);
    return Response(
      200,
      body: imagesList,
      headers: {'content-type': 'application/json'},
    );
  }
}
