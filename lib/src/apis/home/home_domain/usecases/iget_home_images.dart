import 'package:virtual_shop_backend/src/apis/home/home_domain/entities/home_images.dart';

abstract class IGetHomeImages {
  Future<List<HomeImages>>? getHomeImages();
}