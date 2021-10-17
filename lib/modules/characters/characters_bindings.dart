import 'package:comics_marvel/modules/characters/characters_page_controller.dart';

import 'package:get/get.dart';

class CharactersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CharactersPageController(), permanent: true);
  }
}
