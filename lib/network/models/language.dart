// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Language extends Equatable {

  final String name;
  final String fluency;
  const Language({
    required this.name,
    required this.fluency,
  });


  Language copyWith({
    String? name,
    String? fluency,
    double? value,
  }) {
    return Language(
      name: name ?? this.name,
      fluency: fluency ?? this.fluency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fluency': fluency,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      name: map['name'] as String,
      fluency: map['fluency']??'Native Speaker',
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, fluency];
}
