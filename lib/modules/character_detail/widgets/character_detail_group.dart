import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:comics_marvel/modules/character_detail/widgets/character_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailGroup extends GetView<CharacterDetailController> {
  final Character character;
  const CharacterDetailGroup({required this.character, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Obx(() {
    // return Flexible(
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: controller.comicsId.length,
    //     itemBuilder: (_, index) {
    //       if (controller.comicsId.isNotEmpty) {
    //         if (index > (controller.comicsId.length * 0.7).toInt() &&
    //             controller.canCall == false) {
    //           controller.moreData();
    //         }
    //       }
    //       ComicsCharacterId _comicId = controller.comicsId[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //     "${controller.character.thumbnail.extension}.${controller.character.thumbnail.path}"),
        CharacterDetailCard(
          character: controller.character,
        ),
      ],
    );
    //});
  }
}
