// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';

class ProductsResources extends Resource {
  @override
  List<Route> get routes => [Route.get('/products', getAllProducts)];

  FutureOr<Response> getAllProducts(Injector injector) async {
    final presenter = injector.get<IProductsPresenter>();
    return presenter.getAllProducts();
  }
}
