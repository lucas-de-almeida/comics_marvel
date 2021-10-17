import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:get/get.dart';

class CharacterDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CharacterDetailController());
  }
}
