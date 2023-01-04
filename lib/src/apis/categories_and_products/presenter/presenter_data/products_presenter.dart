// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/presenter_data/iproducts_presenter.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/presenter_data/module_responses.dart';
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
    return ModuleResponses.getAllCategories(list: result);
  }

  @override
  FutureOr<Response> getProducts() async {
    final result = await usecase.getProducts();
    return ModuleResponses.getAllProducts(proucts: result);
  }

  @override
  FutureOr<Response> createCategory({CategoryModel? category}) async {
    final categoryList = await usecase.createCategories(category: category!);
    return ModuleResponses.createCategory(category: categoryList);
  }

  @override
  FutureOr<Response> createProduct({ProductModel? product}) async {
    final result = await usecase.createProducts(product: product!);
    return ModuleResponses.createProduct(products: result);
  }

  @override
  FutureOr<Response>? getCategoryById({CategoryModel? category}) async {
    final result = await usecase.getCategoryById(category: category!);
    return ModuleResponses.getCategoryById(category: result);
  }

  @override
  FutureOr<Response>? getProductById({ProductModel? product}) async {
    final result = await usecase.getProductById(product: product!);
    return ModuleResponses.getProductById(product: result!);
  }

  @override
  FutureOr<Response>? listCategoryProducts({CategoryModel? category}) async {
    final result = await usecase.listCategoryProducts(category: category!);
    return ModuleResponses.listCategoryProducts(
        products: result, category: category);
  }

  @override
  FutureOr<Response>? productAndCategoryAssociation({CatAndProd? info}) async {
    await usecase.productAndCategoryAssociation(info: info!);
    return ModuleResponses.productAndCategoryAssociation(info: info);
  }
}
