// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Skills extends Equatable {

  final String? name;
  final String? level;
  final String? domain;

  const Skills({
    this.name,
    this.level,
    this.domain,
  });

  Skills copyWith({
    String? name,
    String? level,
    String? domain,
  }) {
    return Skills(
      name: name ?? this.name,
      level: level ?? this.level,
      domain: domain ?? this.domain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'domain': domain,
    };
  }

  factory Skills.fromMap(Map<String, dynamic> map) {
    return Skills(
      name: map['name'] != null ? map['name'] as String : null,
      level: map['level'] != null ? map['level'] as String : null,
      domain: map['domain'] != null ? map['domain'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Skills.fromJson(String source) => Skills.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name??'', level??'', domain??''];
}
