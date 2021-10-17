import 'package:comics_marvel/models/comics_character_id.dart';
import 'package:comics_marvel/modules/character_detail/character_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterDetailCardComics extends GetView<CharacterDetailController> {
  final ComicsCharacterId comicsId;
  const CharacterDetailCardComics({required this.comicsId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 40),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
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
                      '${comicsId.thumbnail.path}.${comicsId.thumbnail.extension}',
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
