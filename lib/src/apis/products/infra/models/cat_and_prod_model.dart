import 'dart:convert';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatAndProd {
  String cp_id;
  String cat_id;
  String prod_id;

  CatAndProd({required this.cp_id, required this.cat_id, required this.prod_id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cp_id': cp_id,
      'cat_id': cat_id,
      'prod_id': prod_id,
    };
  }

  factory CatAndProd.fromMap(Map<String, dynamic> map) {
    return CatAndProd(
      cp_id: map['cp_id'] as String,
      cat_id: map['cat_id'] as String,
      prod_id: map['prod_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatAndProd.fromJson(String source) => CatAndProd.fromMap(json.decode(source) as Map<String, dynamic>);
}
