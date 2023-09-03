// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Education extends Equatable {

  final String? institution;
  final String? url;
  final String? area;
  final String? studyType;
  final String? startDate;
  final String? endDate;
  final String? score;

  const Education({
    this.institution,
    this.url,
    this.area,
    this.studyType,
    this.startDate,
    this.endDate,
    this.score,
  });


  Education copyWith({
    String? institution,
    String? url,
    String? area,
    String? studyType,
    String? startDate,
    String? endDate,
    String? score,
  }) {
    return Education(
      institution: institution ?? this.institution,
      url: url ?? this.url,
      area: area ?? this.area,
      studyType: studyType ?? this.studyType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'institution': institution,
      'url': url,
      'area': area,
      'studyType': studyType,
      'startDate': startDate,
      'endDate': endDate,
      'score': score,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      institution: map['institution'] != null ? map['institution'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      area: map['area'] != null ? map['area'] as String : null,
      studyType: map['studyType'] != null ? map['studyType'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
      score: map['score'] != null ? map['score'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) => Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      institution??'',
      url??'',
      area??'',
      studyType??'',
      startDate??'',
      endDate??'',
      score??'',
    ];
  }
}
