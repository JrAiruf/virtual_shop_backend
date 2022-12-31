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
  FutureOr<Response> createCategory(
      {CategoryModel? category, ProductModel? product}) async {
    final categoryList =
        await usecase.createCategories(category: category!, product: product!);
    final cat = categoryList?.map((item) {
      final productMap = {
        'productid': product.productid,
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'images': product.images,
        'cid': item.categoryid,
        'size': product.size,
      };
      return {
        'categoryid': item.categoryid,
        'title': item.title,
        'iconimage': item.iconimage,
        'products': productMap,
      };
    }).toList();

    final categories = jsonEncode(cat);
    return Response(
      200,
      body: categories,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  FutureOr<Response> createProduct({ProductModel? product}) async {
    final result = await usecase.createProducts(product: product!);
    final body = result
        ?.map((item) => {
              'productid': item.productid,
              'title': item.title,
              'description': item.description,
              'cid': item.cid,
              'price': item.price,
              'images': item.images,
              'size': item.size,
            })
        .toList();
    final productsList = jsonEncode(body);
    return Response(
      200,
      body: productsList,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  FutureOr<Response> getCategories() async {
    final result = await usecase.getCategories();
    final categoriesList = result!.map(
      (item) {
        return {
          'categoryid': item.categoryid,
          'title': item.title,
          'iconimage': item.iconimage,
          'products': item.products
        };
      },
    ).toList();
    final body = jsonEncode(categoriesList);
    return Response(
      200,
      body: body,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response>? getCategoryById({required String categoryId}) async {
    final result = await usecase.getCategoryById(categoryId: categoryId);
    final categoryMap = {
      'categoryid': result!.categoryid,
      'title': result.title,
      'iconimage': result.iconimage,
      'products': result.products,
    };
    final body = jsonEncode(categoryMap);
    if (categoryId == result.categoryid) {
      return Response(
        200,
        body: body,
        headers: {'content-type': 'application/json'},
      );
    }
    throw Exception();
  }

  @override
  Future<Response>? addProductToCategory(
      {String? categoryId, ProductModel? product}) async {
    await usecase.addProductToCategory(
        categoryId: categoryId!, product: product!);
    final body = {
      'productid': product.productid,
      'title': product.title,
      'description': product.description,
      'cid': product.cid,
      'price': product.price,
      'images': product.images,
      'size': product.size,
    };
    final categoryMap = jsonEncode(body);
    return Response(
      200,
      body: categoryMap,
      headers: {
        'content-type': 'application/json ',
      },
    );
  }
}
