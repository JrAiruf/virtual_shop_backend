import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/dependencies/home_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/home_resources.dart';
import 'package:virtual_shop_backend/src/apis/products/dependencies/product_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/products/presenter/products_resources.dart';

class IJMainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        ...HomeDependencies.dependencies,
        ...ProductDependencies.dependencies,
      ];
  @override
  List<ModularRoute> get routes => [
        Route.resource(HomeResources()),
        Route.resource(ProductsResources())
      ];
}
