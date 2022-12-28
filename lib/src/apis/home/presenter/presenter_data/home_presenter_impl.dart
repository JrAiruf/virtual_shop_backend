// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/home/home_domain/usecases/iget_home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/presenter_data/ihome_presenter.dart';

class HomePresenterImpl implements IHomePresenter {
  HomePresenterImpl({required this.presenter});
  IGetHomeImages presenter;

  @override
  FutureOr<Response> getHomeImages() async {
    final result = await presenter.getHomeImages();

    final body = result!.map((item) => {
      'url': item.url,
      'position': item.position,
      'xAxis': item.xAxis,
      'yAxis': item.yAxis,
    }).toList();
    final imagesList = jsonEncode(body);

    return Response(
      200,
      body: imagesList,
      headers: {'content-type': 'application/json'},
    );
  }
}
