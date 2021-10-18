import 'dart:convert';

import 'thumbnail.dart';

class Character {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;

  bool? clicked = false;
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
    this.clicked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toMap(),
      'resourceURI': resourceURI,
      'clicked': clicked,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      modified: map['modified'],
      thumbnail: Thumbnail.fromMap(map['thumbnail']),
      resourceURI: map['resourceURI'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));
}
