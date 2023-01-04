// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/cat_and_prod_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/product_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';
import '../products_repository/iproducts_repository.dart';
import 'iproducts_and_categories.dart';

class ProductsAndCategoriesImpl implements IProductsAndCategories {
  ProductsAndCategoriesImpl({required this.repository});
  final IProductsRepository repository;

  @override
  Future<List<AppCategories>>? getCategories() async {
    final result = await repository.getCategories();
    return result!;
  }

  @override
  Future<List<AppProducts>>? getProducts() async {
    final result = await repository.getProducts();
    return result!;
  }

  @override
  Future<List<AppCategories>>? createCategories(
      {CategoryModel? category, ProductModel? product}) async {
    final result = await repository.createCategories(category: category!);
    return result!;
  }

  @override
  Future<List<AppProducts>>? createProducts({ProductModel? product}) async {
    final result = await repository.createProducts(product: product!);
    return result!;
  }

  @override
  Future<AppCategories>? getCategoryById({CategoryModel? category}) async {
    final result = await repository.getCategoryById(category: category!);
    return result!;
  }

  @override
  Future<AppProducts>? getProductById({ProductModel? product}) async {
    final result = await repository.getProductById(product: product!);
    return result!;
  }

  @override
  Future<List<ProductModel>>? listCategoryProducts(
      {CategoryModel? category}) async {
    final result = await repository.listCategoryProducts(category: category!);
    return result!;
  }

  @override
  Future<CatAndProd> productAndCategoryAssociation({CatAndProd? info}) async {
    final result = await repository.createAssociation(info: info!);
    return result;
  }
}
