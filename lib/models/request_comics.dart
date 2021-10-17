import 'package:comics_marvel/models/comics.dart';

class RequestComics {
  int? limit;
  int? offset;
  int? total;
  List<Comics>? comics;
  RequestComics({
    this.limit,
    this.offset,
    this.total,
    this.comics,
  });
}
