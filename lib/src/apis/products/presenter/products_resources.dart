// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';

import '../infra/models/cat_and_prod_model.dart';

class ProductsResources extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/categories', _getCategories),
        Route.get('/categories/products', _getProducts),
        Route.post('/categories', _createCategory),
        Route.post('/categories/products', _createProducts),
        Route.get('/categories/:id', _getCategoryById),
        Route.post('/categoryProducts', _productAndCategoryAssociation),
      ];

  FutureOr<Response> _getCategories(Injector injector) async {
    final presenter = injector.get<IProductsPresenter>();
    return presenter.getCategories();
  }

  FutureOr<Response> _getProducts(Injector injector) async {
    final presenter = injector.get<IProductsPresenter>();
    return presenter.getProducts();
  }

  FutureOr<Response> _createCategory(
      Injector injector, ModularArguments arguments) async {
    final category = CategoryModel.fromMap(arguments.data);
    final presenter = injector.get<IProductsPresenter>();
    return presenter.createCategory(category: category);
  }

  FutureOr<Response> _createProducts(
      Injector injector, ModularArguments arguments) async {
    final product = ProductModel.fromMap(arguments.data);
    final presenter = injector.get<IProductsPresenter>();
    return presenter.createProduct(product: product);
  }

  FutureOr<Response> _getCategoryById(
      Injector injector, ModularArguments arguments) async {
    final presenter = injector.get<IProductsPresenter>();
    return presenter.getCategoryById(categoryId: arguments.params['id'])!;
  }

  FutureOr<Response> _productAndCategoryAssociation(
      Injector injector, ModularArguments arguments) async {
    final info = CatAndProd.fromMap(arguments.data);
    final presenter = injector.get<IProductsPresenter>();
    return presenter.productAndCategoryAssociation(info: info)!;

  }
}
