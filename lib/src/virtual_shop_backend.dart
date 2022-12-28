import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:virtual_shop_backend/src/virtual_shop_module.dart';

Future<Handler> ijShelfModular() async {
  final handler = Modular(module: IJMainModule(), middlewares: [logRequests()]);
  return handler;
}
