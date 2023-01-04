// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:virtual_shop_backend/src/apis/home/home_domain/usecases/iget_home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/presenter_data/ihome_presenter.dart';
import 'package:virtual_shop_backend/src/apis/home/presenter/presenter_data/response_module.dart';
import '../../infra/models/home_images.dart';

class HomePresenterImpl implements IHomePresenter {
  HomePresenterImpl({required this.usecase});
  IGetHomeImages usecase;

  @override
  FutureOr<Response> getHomeImages() async {
    final result = await usecase.getHomeImages();
    return HomeModule.getImagesResponse(body: result!);
  }

  @override
  FutureOr<Response> uploadImages({HomeImagesModel? image}) async {
    await usecase.uploadImages(image: image!);
    return HomeModule.uploadImagesResponse(body: image);
  }
}
