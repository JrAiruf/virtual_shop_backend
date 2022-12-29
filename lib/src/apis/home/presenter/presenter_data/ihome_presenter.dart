import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';

abstract class IHomePresenter {
  FutureOr<Response> getHomeImages();
  FutureOr<Response> uploadImages({HomeImagesModel image});
}
