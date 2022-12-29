// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';
import '../../products_domain/usecases/iget_all_products.dart';

class ProductsPresenterImpl implements IProductsPresenter {
  IGetAllProducts usecase;

  ProductsPresenterImpl({required this.usecase});
  @override
  FutureOr<Response> getHomeImages() {
    // TODO: implement getHomeImages
    throw UnimplementedError();
  }
}