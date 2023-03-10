// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop_backend/src/apis/home/home_domain/entities/home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/home_domain/usecases/iget_home_images.dart';
import 'package:virtual_shop_backend/src/apis/home/infra/models/home_images.dart';

import '../home_repository/home_repository.dart';

class GetHomeImagesImpl implements IGetHomeImages {
  GetHomeImagesImpl({required this.repository});

  final HomeRepository repository;
  @override
  Future<List<HomeImages>>? getHomeImages() async {
    final result = await repository.getHomeImages();
    return result;
  }

  @override
  Future<void>? uploadImages({HomeImagesModel? image}) async {
    await repository.uploadImages(image: image!);
  }
}
