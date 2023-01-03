import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/categories_and_products/external/database/products_database_impl.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';
import '../infra/data/iproducts_datasource.dart';
import '../infra/repository/get_all_products_repo.dart';
import '../presenter/presenter_data/iproducts_presenter.dart';
import '../presenter/presenter_data/products_presenter.dart';
import '../presenter/products_resources.dart';
import '../products_domain/products_repository/iproducts_repository.dart';
import '../products_domain/usecases/products_and_categories_impl.dart';
import '../products_domain/usecases/iproducts_and_categories.dart';

abstract class ProductDependencies extends Module {

  static final List<Bind> dependencies = <Bind>[
    Bind.instance((i) => DotEnvService.instance),
    Bind.singleton<IProductsDatasource>((i) => ProductsDatabaseImpl(dotEnv: i())),
    Bind.singleton<IProductsRepository>((i) => GetAllProductsRepo(datasource: i())),
    Bind.singleton<IProductsAndCategories>((i) => ProductsAndCategoriesImpl(repository: i())),
    Bind.singleton<IProductsPresenter>((i) => ProductsPresenterImpl(usecase: i())),
    Bind.singleton((i) => ProductsResources())
  ];
}
