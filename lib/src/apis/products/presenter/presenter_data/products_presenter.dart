// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';
import '../../infra/models/category_model.dart';
import '../../infra/models/product_model.dart';
import '../../products_domain/usecases/iproducts_and_categories.dart';

class ProductsPresenterImpl implements IProductsPresenter {
  IProductsAndCategories usecase;

  ProductsPresenterImpl({required this.usecase});
  @override
  FutureOr<Response> getProducts() async {
    final result = await usecase.getProducts();
    final productsList = result!
        .map((item) => {
              'productid': item.productid,
              'title': item.title,
              'description': item.description,
              'images': item.images,
              'size': item.size,
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

  @override
  FutureOr<Response> createCategory({CategoryModel? category}) async {
    final result = await usecase.createCategories(category: category!);
    final body = result?.map((item) {
      return {
        'categoryid': item.categoryid,
        'title': item.title,
        'iconimage': item.iconimage,
      };
    }).toList();
    final categoryList = jsonEncode(body);
    return Response(200, body: categoryList, headers: {
      'content-type': 'application/json',
    });
  }

  @override
  FutureOr<Response> createProduct({ProductModel? product}) async {
    final result = await usecase.createProducts(product: product!);
    final body = result
        ?.map((item) => {
              'productid': item.productid,
              'title': item.title,
              'description': item.description,
              'price': item.price,
              'images': item.images,
              'size': item.size,
            })
        .toList();
    final productsList = jsonEncode(body);
    return Response(200, body: productsList, headers: {
      'content-type': 'application/json',
    });
  }

  @override
  FutureOr<Response> getCategories() async {
    final result = await usecase.getCategories();
    final categoriesList = result!.map((item) {
      return {
        'categoryid': item.categoryid,
        'title': item.title,
        'iconimage': item.iconimage,
      };
    }).toList();
    final body = jsonEncode(categoriesList);
    return Response(
      200,
      body: body,
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}
