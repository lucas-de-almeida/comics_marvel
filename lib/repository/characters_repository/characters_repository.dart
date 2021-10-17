import 'package:comics_marvel/aplication/helper.dart';
import 'package:comics_marvel/aplication/rest_client/rest_client.dart';
import 'package:comics_marvel/models/character.dart';
import 'package:comics_marvel/models/request_character.dart';
import 'package:flutter/foundation.dart';

class CharactersRepository {
  final RestClient _restClient;
  CharactersRepository({
    required RestClient restClient,
  }) : _restClient = restClient;
  int controlle = 0;

  Future<RequestCharacter?> getPersonagem(int offset) async {
    int limit = 100;
    String urlFinal = gerarUrl("characters", offset: offset, limit: limit);
    debugPrint('$urlFinal---------------controle--$controlle');
    controlle++;

    final result =
        await _restClient.get<RequestCharacter?>(urlFinal, decoder: (data) {
      final resultData = data["data"];
      if (resultData != null) {
        return RequestCharacter(
            limit: resultData['limit'],
            offset: resultData['offset'],
            total: resultData['total'],
            characters: resultData['results']
                .map<Character>((character) => Character.fromMap(character))
                .toList());
      }

      return null;
    }).timeout(const Duration(seconds: 10));

    //if (result.body['code'] == 'RequestThrottled') {
    if (result.hasError) {
      debugPrint('Erro ao buscar characters [${result.statusText}]');
      //"code": "RequestThrottled",
      //"message": "You have exceeded your rate limit.  Please try again later."
      throw Exception('Erro ao buscar characters');
    }
    // ignore: unnecessary_null_in_if_null_operators
    return result.body ?? null;
  }
}
