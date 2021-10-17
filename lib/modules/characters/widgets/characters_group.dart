import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/modules/characters/characters_page_controller.dart';
import 'package:comics_marvel/modules/characters/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersGroup extends GetView<CharactersPageController> {
  final String title = 'Characters';
  final List<Character> characters;
  const CharactersGroup({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Flexible(
        child: ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (_, index) {
            if (controller.characters.isNotEmpty) {
              if (controller.characters.length <= controller.totalLista) {
                if (index > (controller.characters.length * 0.7).toInt() &&
                    controller.canCall == false) {
                  controller.moreData();
                }
              }
            }
            Character _char = controller.characters[index];
            debugPrint('$index ---- ${_char.name}----id: ${_char.id}');
            return Column(
              children: [
                Text(
                  _char.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                CharacterCard(
                  character: _char,
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
