// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class WorkExperience extends Equatable {

  final String? jobTitle;
  final String? employer;
  final String? startDate;
  final String? endDate;
  final String? description;
  final List? achievements;  

  const WorkExperience({
    this.jobTitle,
    this.employer,
    this.startDate,
    this.endDate,
    this.description,
    this.achievements,
  });

  WorkExperience copyWith({
    String? jobTitle,
    String? employer,
    String? startDate,
    String? endDate,
    String? description,
    List? achievements,
  }) {
    return WorkExperience(
      jobTitle: jobTitle ?? this.jobTitle,
      employer: employer ?? this.employer,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      achievements: achievements ?? this.achievements,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobTitle': jobTitle,
      'employer': employer,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'achievements': achievements,
    };
  }

  factory WorkExperience.fromMap( map) {
    return WorkExperience(
      jobTitle: map['job_title'] != null ? map['job_title'] as String : null,
      employer: map['employer'] != null ? map['employer'] as String : null,
      startDate: map['start_date'] != null ? map['start_date'] as String : null,
      endDate: map['end_date'] != null ? map['end_date'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      achievements: map['achievements'] != null ? List.from((map['achievements'] as List)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkExperience.fromJson(String source) => WorkExperience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [];
  }
}
