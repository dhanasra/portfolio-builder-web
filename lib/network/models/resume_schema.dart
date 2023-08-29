import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';

class ResumeSchema extends Equatable {

  final String? name;
  final String? summary;
  final List<Education>? education;
  final List<WorkExperience>? workExperience;
  final List<Project>? projects;

  const ResumeSchema({
    this.name,
    this.summary,
    this.education,
    this.workExperience,
    this.projects,
  });

  ResumeSchema copyWith({
    String? name,
    String? summary,
    List<Education>? education,
    List<WorkExperience>? workExperience,
    List<Project>? projects,
  }) {
    return ResumeSchema(
      name: name ?? this.name,
      summary: summary ?? this.summary,
      education: education ?? this.education,
      workExperience: workExperience ?? this.workExperience,
      projects: projects ?? this.projects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'summary': summary,
      'education': education?.map((x) => x.toMap()).toList(),
      'workExperience': workExperience?.map((x) => x.toMap()).toList(),
      'projects': projects?.map((x) => x.toMap()).toList(),
    };
  }

  factory ResumeSchema.fromMap(Map map) {
    return ResumeSchema(
      name: map['name'] != null ? map['name'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      education: map['education'] != null ? List<Education>.from((map['education'] as List).map<Education?>((x) => Education.fromMap(x as Map<String,dynamic>),),) : null,
      workExperience: map['work_experience'] != null ? List<WorkExperience>.from((map['work_experience'] as List).map<WorkExperience?>((x) => WorkExperience.fromMap(x as Map<String,dynamic>),),) : null,
      projects: map['projects'] != null ? List<Project>.from((map['projects'] as List).map<Project?>((x) => Project.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumeSchema.fromJson(String source) => ResumeSchema.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [];
  }
}
