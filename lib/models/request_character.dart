import 'package:comics_marvel/models/character.dart';

class RequestCharacter {
  int? limit;
  int? offset;
  int? total;
  List<Character>? characters;
  RequestCharacter({
    this.limit,
    this.offset,
    this.total,
    this.characters,
  });
}
