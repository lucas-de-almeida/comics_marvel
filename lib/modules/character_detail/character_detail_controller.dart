import 'package:comics_marvel/aplication/rest_client/rest_client.dart';
import 'package:comics_marvel/aplication/ui/messages/messages_mixin.dart';
import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/models/comics_character_id.dart';
import 'package:comics_marvel/models/request_comics_character_id.dart';
import 'package:comics_marvel/repository/comics_id_repository/comics_id_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

RestClient rClient = RestClient();

class CharacterDetailController extends GetxController
    with MessagesMixin, StateMixin {
  ComicsIdRepository comicsIdRespository =
      ComicsIdRepository(restClient: rClient);
  late Character character;
  final message = Rxn<MessageModel>();
  final comicsId = <ComicsCharacterId>[].obs;

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
    character = Get.arguments;
    messageListener(message);
    comicsId.clear();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    initialCall();
  }

  Future<RequestComicsCharacterId?> initialCall() {
    return getComicsId().then((value) {
      if (value == null) {
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
    await getComicsId();
    canCall = false;
  }

  Future<RequestComicsCharacterId?> getComicsId() async {
    late RequestComicsCharacterId? comicId;
    try {
      change(null, status: RxStatus.loading());
      comicId = await comicsIdRespository.getComicsId(character.id, offset);

      if (comicId?.comics != null) {
        comicsId.addAll(comicId!.comics!);
        change(comicsId, status: RxStatus.success());
      }
    } catch (e, s) {
      change(null, status: RxStatus.error(e.toString()));
      debugPrint('$e $s');
      message(
          MessageModel.error(title: 'Erro', message: 'Erro ao buscar comics'));
    }
  }
}
