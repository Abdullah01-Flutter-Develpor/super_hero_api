// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PowerStats {
  String response;
  String id;
  String name;
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;
  PowerStats({
    required this.response,
    required this.id,
    required this.name,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  PowerStats copyWith({
    String? response,
    String? id,
    String? name,
    String? intelligence,
    String? strength,
    String? speed,
    String? durability,
    String? power,
    String? combat,
  }) {
    return PowerStats(
      response: response ?? this.response,
      id: id ?? this.id,
      name: name ?? this.name,
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      speed: speed ?? this.speed,
      durability: durability ?? this.durability,
      power: power ?? this.power,
      combat: combat ?? this.combat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response,
      'id': id,
      'name': name,
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }

  factory PowerStats.fromMap(Map<String, dynamic> map) {
    return PowerStats(
      response: map['response'] ?? 'resposne',
      id: map['id'] ?? '0',
      name: map['name']  ?? 'no name',
      intelligence: map['intelligence'] ?? 'no int',
      strength: map['strength'] ?? 'no str',
      speed: map['speed'] ?? 'no sped',
      durability: map['durability'] ?? 'no dur',
      power: map['power'] ?? 'no power',
      combat: map['combat'] ?? 'no com',
    );
  }

  String toJson() => json.encode(toMap());

  factory PowerStats.fromJson(String source) => PowerStats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PowerStats(response: $response, id: $id, name: $name, intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  @override
  bool operator ==(covariant PowerStats other) {
    if (identical(this, other)) return true;
  
    return 
      other.response == response &&
      other.id == id &&
      other.name == name &&
      other.intelligence == intelligence &&
      other.strength == strength &&
      other.speed == speed &&
      other.durability == durability &&
      other.power == power &&
      other.combat == combat;
  }

  @override
  int get hashCode {
    return response.hashCode ^
      id.hashCode ^
      name.hashCode ^
      intelligence.hashCode ^
      strength.hashCode ^
      speed.hashCode ^
      durability.hashCode ^
      power.hashCode ^
      combat.hashCode;
  }
}
