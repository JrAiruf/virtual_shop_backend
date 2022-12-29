import 'dart:async';
import 'package:shelf/shelf.dart';

abstract class IProductsPresenter {
  FutureOr<Response> getAllProducts();
}
