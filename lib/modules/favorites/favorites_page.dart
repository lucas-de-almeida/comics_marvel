import 'package:comics_marvel/modules/favorites/favoriters_controller.dart';
import 'package:comics_marvel/modules/favorites/widgets/favorite_character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritersController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.favoriteCharacter
                  .map((m) => FavoriteCharacterCard(
                        character: m,
                        color: Colors.red,
                      ))
                  .toList(),
            ),
          ),
        );
      }),
    ));
  }
}
