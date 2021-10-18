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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterDetailCard(
          character: controller.character,
        ),
      ],
    );
  }
}
