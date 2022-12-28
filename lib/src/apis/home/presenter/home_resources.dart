// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/presenter_data/ihome_presenter.dart';

class HomeResources extends Resource {

  @override
  List<Route> get routes => [Route.get('/images', getImages)];

  FutureOr<Response> getImages(Injector injector) {
    final imagesPath = injector.get<IHomePresenter>();
    return imagesPath.getHomeImages();
  }
}
