// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/errors/home.dart';
import 'package:virtual_shop_backend/src/apis/home/home_domain/entities/home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';

import '../../home_domain/home_repository/home_repository.dart';
import '../data/iget_home_images_datasource.dart';

class HomeRepoImpl implements HomeRepository {
  HomeRepoImpl({required this.datasource});
  final IGetHomeImagesDatasource datasource;

  @override
  Future<List<HomeImages>> getHomeImages() async {
    final list = await datasource.getHomeImages()!;
    if (list.isNotEmpty) {
      return list
          .map((item) => HomeImagesModel.toHomeImages(item.toMap()))
          .toList();
    }
    throw HomeErrors(message: 'Images not found!');
  }

  @override
  Future<void> uploadImages({HomeImagesModel? image}) async {
    if (image != null) {
      await datasource.uploadImages(images: image)!;
    }
    throw HomeErrors(message: 'Upload not possible');
  }
}
