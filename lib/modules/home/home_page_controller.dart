// ignore_for_file: constant_identifier_names

import 'package:comics_marvel/modules/characters/characters_page_controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  CharactersPageController controllerCharacter = Get.find();
  static const NAVIGATOR_KEY = 1;

  static const INDEX_PAGE_EXIT = 2;

  final _pages = ['/character', '/favorites'];
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
  }
}
