import 'package:comics_marvel/aplication/ui/messages/messages_mixin.dart';
import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/models/request_character.dart';
import 'package:comics_marvel/modules/favorites/favoriters_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:comics_marvel/aplication/rest_client/rest_client.dart';
import 'package:comics_marvel/repository/characters_repository/characters_repository.dart';

RestClient rClient = RestClient();

class CharactersPageController extends GetxController
    with MessagesMixin, StateMixin {
  CharactersRepository charactersRepository =
      CharactersRepository(restClient: rClient);

  FavoritersController favoritersController = Get.find();

  final message = Rxn<MessageModel>();
  final characters = <Character>[].obs;

  final _offset = 0.obs;
  int get offset => _offset.value;
  set offset(int newValue) => _offset(newValue);

  final _totalLista = 0.obs;
  int get totalLista => _totalLista.value;
  set totalLista(int newValue) => _totalLista(newValue);

  final _canCall = false.obs;
  bool get canCall => _canCall.value;
  set canCall(bool newValue) => _canCall(newValue);

  @override
  void onInit() {
    super.onInit();
    messageListener(message);
    characters.clear();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    initialCall();
  }

  Future<void> initialCall() {
    return getPersonagem().then((value) {
      if (value!.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (error) {
      change(null, status: RxStatus.error('Ocorreu um erro na requisição.'));
    });
  }

  void moreData() async {
    offset += 100;
    canCall = true;
    await getPersonagem();
    canCall = false;
  }

  Future<List<Character?>?> getPersonagem() async {
    late RequestCharacter? character;
    try {
      character = await charactersRepository.getPersonagem(offset);
      if (character?.total != null) {
        totalLista = character!.total!;
      }
      if (character?.characters != null) {
        characters.addAll(character!.characters!);
      }
      return characters;
    } catch (e, s) {
      debugPrint('$e $s');
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar characters'));
    }
    return null;
  }
}
