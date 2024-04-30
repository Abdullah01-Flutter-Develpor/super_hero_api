// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class SuperHeroImage {
  String response;
  String id;
  String name;
  String url;
  SuperHeroImage({
    required this.response,
    required this.id,
    required this.name,
    required this.url,
  });
  

  SuperHeroImage copyWith({
    String? response,
    String? id,
    String? name,
    String? url,
  }) {
    return SuperHeroImage(
      response: response ?? this.response,
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response,
      'id': id,
      'name': name,
      'url': url,
    };
  }

  factory SuperHeroImage.fromMap(Map<String, dynamic> map) {
    return SuperHeroImage(
      response: map['response'] ?? 'response',
      id: map['id'] ?? '0',
      name: map['name'] ?? 'no name',
      url: map['url'] ?? 'djskfslkabvj',
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHeroImage.fromJson(String source) => SuperHeroImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuperHeroImage(response: $response, id: $id, name: $name, url: $url)';
  }

  @override
  bool operator ==(covariant SuperHeroImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.response == response &&
      other.id == id &&
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode {
    return response.hashCode ^
      id.hashCode ^
      name.hashCode ^
      url.hashCode;
  }
}
