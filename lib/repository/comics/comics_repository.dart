import 'package:comics_marvel/aplication/helper.dart';
import 'package:comics_marvel/aplication/rest_client/rest_client.dart';
import 'package:comics_marvel/models/comics.dart';
import 'package:comics_marvel/models/request_comics.dart';
import 'package:flutter/foundation.dart';

class ComicsRespository {
  final RestClient _restClient;
  ComicsRespository({
    required RestClient restClient,
  }) : _restClient = restClient;

  Future<RequestComics?> getComics(int idPersonagem, int offset) async {
    int limit = 100;

    String urlFinal = gerarUrl("characters/$idPersonagem/comics",
        offset: offset, limit: limit);

    final result =
        await _restClient.get<RequestComics?>(urlFinal, decoder: (data) {
      final resultData = data["data"];
      if (resultData != null) {
        return RequestComics(
            limit: resultData['limit'],
            offset: resultData['offset'],
            total: resultData['total'],
            comics: resultData['results']
                .map<Comics>((comic) => Comics.fromMap(comic))
                .toList());
      }
      return null;
    });
    if (result.hasError) {
      debugPrint('Erro ao buscar  comics [${result.statusText}]');
      throw Exception('Erro ao buscar comics ');
    }
    // ignore: unnecessary_null_in_if_null_operators
    return result.body ?? null;
  }
}
