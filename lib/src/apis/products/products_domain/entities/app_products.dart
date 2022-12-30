// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppProducts {
  final String? id;
  final String? title;
  final String? description;
  final String? cid;
  final double? price;
  final List<dynamic>? size;
  final List<dynamic>? images;

  AppProducts({this.description, this.size, this.images, 
      this.id, this.price, this.title, this.cid});
}
