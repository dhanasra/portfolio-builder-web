// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Education extends Equatable {

  final String institution;
  final String degree;
  final String major;
  final String graduationDate;

  const Education({
    required this.institution,
    required this.degree,
    required this.major,
    required this.graduationDate,
  });

  Education copyWith({
    String? institution,
    String? degree,
    String? major,
    String? graduationDate,
  }) {
    return Education(
      institution: institution ?? this.institution,
      degree: degree ?? this.degree,
      major: major ?? this.major,
      graduationDate: graduationDate ?? this.graduationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'institution': institution,
      'degree': degree,
      'major': major,
      'graduation_date': graduationDate,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      institution: map['institution'] as String,
      degree: map['degree'] as String,
      major: map['major'] as String,
      graduationDate: map['graduation_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) => Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [institution, degree, major, graduationDate];
}
