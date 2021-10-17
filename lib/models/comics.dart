import 'dart:convert';

import 'items.dart';

class Comics {
  int available;
  String collectionURI;
  List<Items> items;
  int returned;

  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
      'returned': returned,
    };
  }

  factory Comics.fromMap(Map<String, dynamic> map) {
    return Comics(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
      returned: map['returned'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comics.fromJson(String source) => Comics.fromMap(json.decode(source));
}
