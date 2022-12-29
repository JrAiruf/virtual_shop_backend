// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/presenter_data/ihome_presenter.dart';

class HomeResources extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/images', getImages),
        Route.post('/images', uploadImages),
      ];

  FutureOr<Response> getImages(Injector injector) {
    final ijImages = injector.get<IHomePresenter>();
    return ijImages.getHomeImages();
  }

  FutureOr<Response> uploadImages(
      Injector injector, ModularArguments arguments) async {
    final images = HomeImagesModel.fromMap(arguments.data!);
    final ijImages = injector.get<IHomePresenter>();
    return ijImages.uploadImages(image: images);
  }
}
