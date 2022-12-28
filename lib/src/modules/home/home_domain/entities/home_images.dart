// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeImages {
  String? url;
  int? position;
  int? xAxis;
  int? yAxis;

  HomeImages({this.url, this.position, this.xAxis, this.yAxis});

  String? get imageUrl => url;
  int? get x => xAxis;
  int? get y => yAxis;
  int? get pos => position;
}
