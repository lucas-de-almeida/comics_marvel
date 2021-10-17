/* # This file will contain your array routing ex :  
        # class AppPages { static final pages = [  
        #  GetPage(name: Routes.HOME, page:()=> HomePage()) 
        # ]};  */

import 'package:comics_marvel/modules/character_detail/character_detail_page.dart';
import 'package:comics_marvel/modules/character_detail/character_detail_binding.dart';
import 'package:comics_marvel/modules/home/home_page.dart';
import 'package:comics_marvel/modules/home/home_page_bindigns.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const HomePage(),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: Routes.CHARACTERDETAIL,
      page: () => const CharacterDetailPage(),
      bindings: [
        CharacterDetailBinding(),
      ],
    ),
  ];
}
