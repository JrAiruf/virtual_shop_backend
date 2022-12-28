import 'package:virtual_shop_backend/src/modules/home/home_domain/entities/home_images.dart';

abstract class HomeRepository {
  Future<List<HomeImages>> getHomeImages();
}
