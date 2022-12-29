// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';
import '../../products_domain/usecases/iproducts_and_categories.dart';

class ProductsPresenterImpl implements IProductsPresenter {
  IProductsAndCategories usecase;

  ProductsPresenterImpl({required this.usecase});
  @override
  FutureOr<Response> getAllProducts() async {
    final result = await usecase.getProducts();
    final productsList = result!
        .map((item) => {
              'id': item.id,
              'title': item.title,
              'price': item.price,
            })
        .toList();
    final body = jsonEncode(productsList);
    return Response(
      200,
      body: body,
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}
