// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/presenter_data/iproducts_presenter.dart';
import '../../infra/models/cat_and_prod_model.dart';
import '../../infra/models/category_model.dart';
import '../../infra/models/product_model.dart';
import '../../products_domain/usecases/iproducts_and_categories.dart';

class ProductsPresenterImpl implements IProductsPresenter {
  IProductsAndCategories usecase;
  ProductsPresenterImpl({required this.usecase});

  @override
  FutureOr<Response> getCategories() async {
    final result = await usecase.getCategories();
    final categoriesList = result!.map(
      (item) {
        return {
          'categoryid': item.categoryid,
          'title': item.title,
          'iconimage': item.iconimage,
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
    final categoryList = await usecase.createCategories(category: category!);
    final cat = categoryList
        ?.map((item) => {
              'categoryid': item.categoryid,
              'title': item.title,
              'iconimage': item.iconimage,
            })
        .toList();
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
  Future<Response>? getCategoryById({required String categoryId}) async {
    final result = await usecase.getCategoryById(categoryId: categoryId);
    final categoryMap = {
      'categoryid': result!.categoryid,
      'title': result.title,
      'iconimage': result.iconimage,
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
  Future<Response>? productAndCategoryAssociation({CatAndProd? info}) async {
    await usecase.productAndCategoryAssociation(info: info!);
    final body = jsonEncode(info.toMap());

    return Response(
      200,
      body: body,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @override
  Future<Response>? listCategoryProducts({CategoryModel? category}) async {
    final result = await usecase.listCategoryProducts(category: category!);
    final productsList = result!.map(
      (item) => {
        'categoryid': category.categoryid,
        'title': category.title,
        'products': {
          'productid': item.productid,
          'title': item.title,
          'description': item.description,
          'price': item.price,
          'images': item.images,
          'size': item.size
        }
      },
    ).toList();
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