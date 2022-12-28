import 'dart:async';

import 'package:shelf/shelf.dart';

abstract class IHomePresenter {
  FutureOr<Response> getHomeImages();
}
