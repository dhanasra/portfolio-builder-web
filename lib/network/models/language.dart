// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Language extends Equatable {

  final String language;
  final String fluency;
  final double value;
  const Language({
    required this.language,
    required this.fluency,
    required this.value,
  });


  Language copyWith({
    String? language,
    String? fluency,
    double? value,
  }) {
    return Language(
      language: language ?? this.language,
      fluency: fluency ?? this.fluency,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'fluency': fluency,
      'value': value,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      language: map['language'] as String,
      fluency: map['fluency']??'Native Speaker',
      value: map['value']??3,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [language, fluency, value];
}
