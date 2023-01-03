// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppProducts {
  final String? productid;
  final String? title;
  final String? description;
  final String? cid;
  final int? price;
  final List<dynamic>? size;
  final List<dynamic>? images;

  AppProducts({this.description, this.size, this.images, 
      this.productid, this.price, this.title, this.cid});
}
