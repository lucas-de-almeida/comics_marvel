import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/modules/characters/characters_page_controller.dart';
import 'package:comics_marvel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterCard extends GetView<CharactersPageController> {
  final Character character;
  final Color color;
  const CharacterCard({
    this.color = Colors.grey,
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CHARACTERDETAIL, arguments: character);
      },
      child: SizedBox(
        width: 370,
        height: 400,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        width: 350,
                        height: 380,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              left: 265,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 50,
                  child: IconButton(
                    iconSize: 23,
                    icon: Icon(
                      Icons.favorite,
                      color: color,
                    ),
                    onPressed: () {
                      controller.favoritersController.favoriteCharacter
                          .add(character);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
