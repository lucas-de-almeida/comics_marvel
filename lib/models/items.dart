import 'dart:convert';

class Items {
  String resourceURI;
  String name;
  Items({
    required this.resourceURI,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      resourceURI: map['resourceURI'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));
}
