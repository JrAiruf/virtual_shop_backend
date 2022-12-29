// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'app_categories.dart';

class AppProducts {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final AppCategories? category;
  final List<dynamic>? size;
  final List<dynamic>? images;

  AppProducts({this.description, this.size, this.images, this.category,
      this.id, this.price, this.title});
}
