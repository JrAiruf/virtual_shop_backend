import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/home/dependencies/home_dependencies.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/home_resources.dart';

class IJMainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        ...HomeDependencies.dependencies,
      ];
  @override
  List<ModularRoute> get routes => [
        Route.resource(HomeResources()),
      ];
}
