import 'package:test/test.dart';
import 'package:virtual_shop_backend/src/services/dot_env_service/dot_env_service.dart';

void main() {
  test('dot env service ...', () async {
    final service = DotEnvService.instance;

    expect(service['DATABASE_URL'],
        'postgres://postgres:postgrespw@localhost:49154');
  });
}
