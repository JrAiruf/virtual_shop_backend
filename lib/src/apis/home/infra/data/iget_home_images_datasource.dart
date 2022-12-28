import '../models/home_images.dart';

abstract class IGetHomeImagesDatasource {
  Future<List<HomeImagesModel>>? getHomeImages();
}
