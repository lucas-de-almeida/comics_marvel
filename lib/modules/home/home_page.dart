import 'package:comics_marvel/modules/characters/characters_bindings.dart';
import 'package:comics_marvel/modules/characters/characters_page.dart';
import 'package:comics_marvel/modules/favorites/favorites_page.dart';
import 'package:comics_marvel/modules/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.controllerCharacter.moreData(),
        child: const Icon(Icons.replay_outlined),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: const Color(0xffEA4335),
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies), label: 'Characters'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/character',
        key: Get.nestedKey(HomePageController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/character') {
            return GetPageRoute(
                settings: settings,
                page: () => const CharactersPage(),
                binding: CharactersBindings());
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
            );
          }
          return null;
        },
      ),
    );
  }
}
