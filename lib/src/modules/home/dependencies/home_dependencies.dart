import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/modules/home/external/database/home_database_impl.dart';
import 'package:virtual_shop_backend/src/modules/home/home_domain/usecases/iget_home_images.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';
import '../home_domain/home_repository/home_repository.dart';
import '../home_domain/usecases/get_home_images_impl.dart';
import '../infra/data/iget_home_images_datasource.dart';
import '../infra/infra_repository/home_repo_impl.dart';
import '../presenter/presenter_data/home_presenter_impl.dart';
import '../presenter/presenter_data/ihome_presenter.dart';

abstract class HomeDependencies extends Module {
  static List<Bind> dependencies = <Bind>[
    Bind.instance<DotEnvService>(DotEnvService.instance),
    Bind.singleton<IGetHomeImagesDatasource>((i) => HomeDatabaseImpl(dotEnv: i())),
    Bind.singleton<HomeRepository>((i) => HomeRepoImpl(datasource: i())),
    Bind.singleton<IGetHomeImages>((i) => GetHomeImagesImpl(repository: i())),
    Bind.singleton<IHomePresenter>((i) => HomePresenterImpl(presenter: i())),
  ];
}
