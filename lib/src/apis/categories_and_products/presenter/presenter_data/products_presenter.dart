// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/presenter_data/iproducts_presenter.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/presenter_data/module_response.dart';
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
    return ModuleResponse.getAllCategories(list: result);
  }

  @override
  FutureOr<Response> getProducts() async {
    final result = await usecase.getProducts();
    return ModuleResponse.getAllProducts(proucts: result);
  }

  @override
  FutureOr<Response> createCategory({CategoryModel? category}) async {
    final categoryList = await usecase.createCategories(category: category!);
    return ModuleResponse.createCategory(category: categoryList);
  }

  @override
  FutureOr<Response> createProduct({ProductModel? product}) async {
    final result = await usecase.createProducts(product: product!);
    return ModuleResponse.createProduct(products: result);
  }

  @override
  Future<Response>? getCategoryById({CategoryModel? category}) async {
    final result = await usecase.getCategoryById(category: category!);
    return ModuleResponse.getCategoryById(category: result);
  }

  @override
  Future<Response>? getProductById({ProductModel? product}) async {
    final result = await usecase.getProductById(product: product!);
    return ModuleResponse.getProductById(product: result!);
  }

  @override
  Future<Response>? listCategoryProducts({CategoryModel? category}) async {
    final result = await usecase.listCategoryProducts(category: category!);
    return ModuleResponse.listCategoryProducts(
        products: result, category: category);
  }

  @override
  Future<Response>? productAndCategoryAssociation({CatAndProd? info}) async {
    await usecase.productAndCategoryAssociation(info: info!);
    return ModuleResponse.productAndCategoryAssociation(info: info);
  }
}
