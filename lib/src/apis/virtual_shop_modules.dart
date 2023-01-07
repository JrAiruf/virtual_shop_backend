import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/dependencies/home_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/home_resources.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/dependencies/product_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/presenter/products_resources.dart';
import 'package:virtual_shop_backend/src/apis/users/dependencies/app_user_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_resources.dart';
import 'package:virtual_shop_backend/src/services/swagger/swagger_handler.dart';

class IJMainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        ...HomeDependencies.dependencies,
        ...ProductDependencies.dependencies,
        ...AppUserDependencies.dependencies,
      ];
  @override
  List<ModularRoute> get routes => [
        Route.get('/docs/**', swaggerHandler),
        Route.resource(HomeResources()),
        Route.resource(ProductsResources()),
        Route.resource(UserResources()),
      ];
}
