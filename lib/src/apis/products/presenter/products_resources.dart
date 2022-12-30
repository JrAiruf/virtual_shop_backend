// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/presenter_data/iproducts_presenter.dart';

class ProductsResources extends Resource {
  @override
  List<Route> get routes => [
        Route.get('/products', getProducts),
        Route.post('/categories', createCategory),
        Route.post('/categories/products', createProducts),
      ];

  FutureOr<Response> getProducts(Injector injector) async {
    final presenter = injector.get<IProductsPresenter>();
    return presenter.getProducts();
  }

  FutureOr<Response> createCategory(
      Injector injector, ModularArguments arguments) async {
    final category = CategoryModel.fromMap(arguments.data!);
    final presenter = injector.get<IProductsPresenter>();
    return presenter.createCategory(category: category);
  }
  FutureOr<Response> createProducts(
      Injector injector, ModularArguments arguments) async {
    final product = ProductModel.fromMap(arguments.data!);
    final presenter = injector.get<IProductsPresenter>();
    return presenter.createProduct(product: product);
  }
}



/* 
{
    "id": "{{$randomUUID}}",
    "title": "Produto Teste1",
    "description": "Alta Qualidade",
    "price": 45,
    "images": [
        "https: //images.pexels.com/photos/2294342/pexels-photo-2294342.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600"
    ],
    "size": [
        "PP",
        "P",
        "M",
        "G",
        "GG",
        "XG"
    ],
    "category": "Camisetas"
}

 */