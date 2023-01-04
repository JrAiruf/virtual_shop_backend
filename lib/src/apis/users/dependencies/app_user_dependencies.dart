import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/apis/users/external/app_user_database.dart';
import 'package:virtual_shop_backend/src/apis/users/presenter/user_presenter/iuser_presenter.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';

import '../infra/data/iapp_user_datasource.dart';
import '../infra/repo/app_user_usecases_impl.dart';
import '../presenter/user_presenter/user_presenter.dart';
import '../users_domain/usecases/app_user_repo_impl.dart';
import '../users_domain/usecases/iapp_user.dart';
import '../users_domain/users_repository/iapp_user_repo.dart';

abstract class AppUserDependencies extends Module {
  static final List<Bind> dependencies = <Bind>[
    Bind.instance(DotEnvService.instance),
    Bind.singleton<IAppUserDatasource>(((i) => AppUserDatabase(dotEnvService: i()))),
    Bind.singleton<IAppUserRepo>(((i) => AppUserUsecasesImpl(datasource: i()))),
    Bind.singleton<IAppUserUsecases>(((i) => AppUserRepoImpl(repository: i()))),
    Bind.singleton<IUserPresenter>(((i) => UserPresenter(usecase: i()))),
  ];
}
