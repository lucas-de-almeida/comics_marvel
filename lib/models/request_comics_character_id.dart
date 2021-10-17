import 'package:comics_marvel/models/comics_character_id.dart';

class RequestComicsCharacterId {
  int? limit;
  int? offset;
  int? total;
  List<ComicsCharacterId>? comics;
  RequestComicsCharacterId({
    this.limit,
    this.offset,
    this.total,
    this.comics,
  });
}
