import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/infra/models/category_model.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_categories.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/products_domain/entities/app_products.dart';

import '../../infra/models/cat_and_prod_model.dart';

abstract class ModuleResponses {
  static Future<Response> getAllCategories({List<AppCategories>? list}) async {
    if (list != null && list.isNotEmpty) {
      final body = list
          .map(
            (item) => {
              'categoryid': item.categoryid,
              'title': item.title,
              'iconimage': item.iconimage,
            },
          )
          .toList();
      return Response(200, body: jsonEncode(body), headers: {
        'content-type': 'application/json',
      });
    }
    return Response(
      404,
      body: jsonEncode(
        {'erro': 'Images not found'},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  static Future<Response> getAllProducts({List<AppProducts>? proucts}) async {
    if (proucts != null && proucts.isNotEmpty) {
      final body = proucts
          .map(
            (item) => {
              'productid': item.productid,
              'title': item.title,
              'description': item.description,
              'images': item.images,
              'size': item.size,
              'price': item.price,
            },
          )
          .toList();
      return Response(200, body: jsonEncode(body), headers: {
        'content-type': 'application/json',
      });
    }
    return Response(
      404,
      body: jsonEncode(
        {'erro': 'Products not found'},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  static Future<Response> createCategory(
      {List<AppCategories>? category}) async {
    if (category != null && category.isNotEmpty) {
      final body = category
          .map(
            (item) => {
              'categoryid': item.categoryid,
              'title': item.title,
              'iconimage': item.iconimage,
            },
          )
          .toList();
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode({'message': 'Category not created'}),
      headers: {'content-type': 'application/json'},
    );
  }

  static Future<Response> createProduct({List<AppProducts>? products}) async {
    if (products != null && products.isNotEmpty) {
      final body = products
          .map(
            (item) => {
              'productid': item.productid,
              'title': item.title,
              'description': item.description,
              'price': item.price,
              'images': item.images,
              'size': item.size,
            },
          )
          .toList();
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode({'message': 'Product not created'}),
      headers: {'content-type': 'application/json'},
    );
  }

  static Future<Response> getCategoryById({AppCategories? category}) async {
    if (category != null) {
      final body = {
        'categoryid': category.categoryid,
        'title': category.title,
        'iconimage': category.iconimage,
      };
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode(
        {'message': "Couldn't get category"},
      ),
      headers: {'content-type': 'application/json'},
    );
  }

  static Future<Response> getProductById({AppProducts? product}) async {
    if (product != null) {
      final body = {
        'productid': product.productid,
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'images': product.images,
        'size': product.size,
      };
      return Response(
        200,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );
    }
    return Response(
      400,
      body: jsonEncode(
        {'message': "Couldn't get product"},
      ),
      headers: {'content-type': 'application/json'},
    );
  }

  static Future<Response> listCategoryProducts(
      {List<AppProducts>? products, CategoryModel? category}) async {
    if (products != null && products.isNotEmpty) {
      final body = products
          .map(
            (item) => {
              'categoryid': category!.categoryid,
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
          )
          .toList();
      return Response(
        200,
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json',
        },
      );
    }
    return Response(
      400,
      body: jsonEncode(
        {"message": "Couldn't to list products"},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  static Future<Response> productAndCategoryAssociation(
      {CatAndProd? info}) async {
    if (info != null) {
      final body = info.toMap();
      return Response(
        200,
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json',
        },
      );
    }

    return Response(
      400,
      body: jsonEncode(
        {"message": "Product not registered"},
      ),
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}
