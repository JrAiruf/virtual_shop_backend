// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ApplicationErrors implements Exception {}

class HomeErrors extends ApplicationErrors {
  HomeErrors({this.message, this.error});
  final String? message;
  final String? error;
}
