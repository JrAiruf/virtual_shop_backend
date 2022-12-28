import 'dart:io';

class DotEnvService {
  static DotEnvService instance = DotEnvService._();
  DotEnvService._() {
    _init();
  }

  static final Map<String, String> _map = {};
  void _init() {
    final file = File('.env');
    final envText = file.readAsStringSync();
    for (final line in envText.split('\n')) {
      final lineBreak = line.split('=');
      _map[lineBreak[0]] = lineBreak[1];
    }
  }

  String? operator [](String? key) {
    return _map[key];
  }
}
