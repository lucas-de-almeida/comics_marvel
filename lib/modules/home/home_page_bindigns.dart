import 'package:comics_marvel/modules/favorites/favoriters_controller.dart';
import 'package:comics_marvel/modules/home/home_page_controller.dart';

import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.put(FavoritersController(), permanent: true);
  }
}
