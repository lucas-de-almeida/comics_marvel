import 'package:comics_marvel/modules/characters/characters_page_controller.dart';
import 'package:comics_marvel/modules/characters/widgets/characters_group.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersPage extends GetView<CharactersPageController> {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        CharactersGroup(
          characters: controller.characters,
        ),
      ],
    );
  }
}
