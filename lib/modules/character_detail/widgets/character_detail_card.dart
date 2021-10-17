import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterDetailCard extends GetView<CharacterDetailController> {
  final Character character;
  const CharacterDetailCard({required this.character, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 150,
        height: 230,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:
                            '${character.thumbnail.path}.${character.thumbnail.extension}',
                        width: 130,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
