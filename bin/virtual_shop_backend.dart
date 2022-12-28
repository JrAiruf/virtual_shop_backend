import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:virtual_shop_backend/src/virtual_shop_backend.dart';

void main() async {
  final mainHandler = await ijShelfModular();
  final server = await shelf_io.serve(mainHandler, '0.0.0.0', 4466);
  print('Server online on - ${server.address.address}: port ${server.port}');
}
