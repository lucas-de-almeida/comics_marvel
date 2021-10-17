import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:comics_marvel/modules/character_detail/widgets/character_detail_group_comics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailPage extends GetView<CharacterDetailController> {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 500,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            CharacterDetailGroupComics(
              character: controller.character,
            ),
          ],
        ),
      ),
    );
  }
}
