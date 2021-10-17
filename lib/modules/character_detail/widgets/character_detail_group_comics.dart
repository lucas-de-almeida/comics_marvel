import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/models/comics_character_id.dart';
import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:comics_marvel/modules/character_detail/widgets/character_detail_card.dart';
import 'package:comics_marvel/modules/character_detail/widgets/character_detail_card_comics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailGroupComics extends GetView<CharacterDetailController> {
  final Character character;
  const CharacterDetailGroupComics({required this.character, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.comicsId.length,
                itemBuilder: (_, index) {
                  if (controller.comicsId.isNotEmpty) {
                    if (index > (controller.comicsId.length * 0.7).toInt() &&
                        controller.canCall == false) {
                      controller.moreData();
                    }
                  }
                  ComicsCharacterId _comicId = controller.comicsId[index];

                  return Column(
                    children: [
                      CharacterDetailCardComics(
                        comicsId: _comicId,
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              height: Get.height * 0.26,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterDetailCard(
                      character: controller.character,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(controller.character.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Visibility(
                            visible: true,
                            child: Text(
                              controller.character.description,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                            ),
                            replacement: const Text(
                              'Dscription of charatcer in production',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 8,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
