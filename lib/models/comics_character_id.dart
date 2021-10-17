import 'dart:convert';

import 'package:comics_marvel/models/thumbnail.dart';

class ComicsCharacterId {
  int id;

  String title;

  int pageCount;

  Thumbnail thumbnail;
  ComicsCharacterId({
    required this.id,
    required this.title,
    required this.pageCount,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pageCount': pageCount,
      'thumbnail': thumbnail.toMap(),
    };
  }

  factory ComicsCharacterId.fromMap(Map<String, dynamic> map) {
    return ComicsCharacterId(
      id: map['id'],
      title: map['title'],
      pageCount: map['pageCount'],
      thumbnail: Thumbnail.fromMap(map['thumbnail']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicsCharacterId.fromJson(String source) =>
      ComicsCharacterId.fromMap(json.decode(source));
}
