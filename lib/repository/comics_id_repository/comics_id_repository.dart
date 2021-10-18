import 'package:comics_marvel/aplication/helper.dart';
import 'package:comics_marvel/aplication/rest_client/rest_client.dart';
import 'package:comics_marvel/models/comics_character_id.dart';
import 'package:comics_marvel/models/request_comics_character_id.dart';

class ComicsIdRepository {
  final RestClient _restClient;
  ComicsIdRepository({
    required RestClient restClient,
  }) : _restClient = restClient;
  Future<RequestComicsCharacterId?> getComicsId(
      int idPersonagem, int offset) async {
    int limit = 100;
    String urlFinal = gerarUrl("characters/$idPersonagem/comics",
        offset: offset, limit: limit);

    final result = await _restClient.get<RequestComicsCharacterId?>(urlFinal,
        decoder: (data) {
      final resultData = data["data"];
      if (resultData != null) {
        return RequestComicsCharacterId(
            limit: resultData['limit'],
            offset: resultData['offset'],
            total: resultData['total'],
            comics: resultData['results']
                .map<ComicsCharacterId>(
                    (comicsId) => ComicsCharacterId.fromMap(comicsId))
                .toList());
      }
      return null;
    });
    if (result.hasError) {
      throw Exception('Erro ao buscar comics com id ');
    }
    // ignore: unnecessary_null_in_if_null_operators
    return result.body ?? null;
  }
}
