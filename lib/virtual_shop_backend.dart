import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'src/apis/virtual_shop_modules.dart';

Future<Handler> ijShelfModular() async {
  final handler = Modular(module: IJMainModule(), middlewares: [logRequests()]);
  return handler;
}
