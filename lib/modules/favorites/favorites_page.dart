import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        shrinkWrap: true,
        children: const [Text('favoritos')],
      ),
    );
  }
}
