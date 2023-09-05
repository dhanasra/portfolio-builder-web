// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:portfolio_builder_ai/network/models/award.dart';
import 'package:portfolio_builder_ai/network/models/basic.dart';
import 'package:portfolio_builder_ai/network/models/certificate.dart';
import 'package:portfolio_builder_ai/network/models/education.dart';
import 'package:portfolio_builder_ai/network/models/language.dart';
import 'package:portfolio_builder_ai/network/models/location.dart';
import 'package:portfolio_builder_ai/network/models/project.dart';
import 'package:portfolio_builder_ai/network/models/publication.dart';
import 'package:portfolio_builder_ai/network/models/reference.dart';
import 'package:portfolio_builder_ai/network/models/skills.dart';
import 'package:portfolio_builder_ai/network/models/work_experience.dart';

class ResumeSchema extends Equatable {

  final Basic basic;
  final List<Education> education;
  final List<WorkExperience> workExperience;
  final List<Project> projects;
  final List<Award> awards;
  final List<Certificate> certificates;
  final List<Publication> publications;
  final List<Reference> references;
  final List<Language> languages;
  final List<Skills> skills;

  const ResumeSchema({
    this.basic = const Basic(),
    this.education = const [],
    this.workExperience = const [],
    this.projects = const [],
    this.awards = const [],
    this.certificates = const [],
    this.publications = const [],
    this.references = const [],
    this.languages = const [],
    this.skills = const [],
  });
  

  ResumeSchema copyWith({
    Basic? basic,
    Location? location,
    List<Education>? education,
    List<WorkExperience>? workExperience,
    List<Project>? projects,
    List<Award>? awards,
    List<Certificate>? certificates,
    List<Publication>? publications,
    List<Reference>? references,
    List<Language>? languages,
    List<Skills>? skills,
  }) {
    return ResumeSchema(
      basic: basic ?? this.basic,
      education: education ?? this.education,
      workExperience: workExperience ?? this.workExperience,
      projects: projects ?? this.projects,
      awards: awards ?? this.awards,
      certificates: certificates ?? this.certificates,
      publications: publications ?? this.publications,
      references: references ?? this.references,
      languages: languages ?? this.languages,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'basic': basic.toMap(),
      'education': education.map((x) => x.toMap()).toList(),
      'workExperience': workExperience.map((x) => x.toMap()).toList(),
      'projects': projects.map((x) => x.toMap()).toList(),
      'awards': awards.map((x) => x.toMap()).toList(),
      'certificates': certificates.map((x) => x.toMap()).toList(),
      'publications': publications.map((x) => x.toMap()).toList(),
      'references': references.map((x) => x.toMap()).toList(),
      'languages': languages.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
    };
  }

  factory ResumeSchema.fromMap(Map<String, dynamic> map) {
    return ResumeSchema(
      basic: Basic.fromMap(map['basics'] as Map),
      education: map['education'] != null ? List<Education>.from((map['education'] as List).map<Education?>((x) => Education.fromMap(x as Map),),) : [],
      workExperience: map['workExperience'] != null ? List<WorkExperience>.from((map['workExperience'] as List).map<WorkExperience?>((x) => WorkExperience.fromMap(x as Map),),) : [],
      projects: map['projects'] != null ? List<Project>.from((map['projects'] as List).map<Project?>((x) => Project.fromMap(x as Map),),) : [],
      awards: map['awards'] != null ? List<Award>.from((map['awards'] as List).map<Award?>((x) => Award.fromMap(x as Map),),) : [],
      certificates: map['certificates'] != null ? List<Certificate>.from((map['certificates'] as List).map<Certificate?>((x) => Certificate.fromMap(x as Map),),) : [],
      publications: map['publications'] != null ? List<Publication>.from((map['publications'] as List).map<Publication?>((x) => Publication.fromMap(x as Map),),) : [],
      references: map['references'] != null ? List<Reference>.from((map['references'] as List).map<Reference?>((x) => Reference.fromMap(x as Map),),) : [],
      languages: map['languages'] != null ? List<Language>.from((map['languages'] as List).map<Language?>((x) => Language.fromMap(x as Map),),) : [],
      skills: map['skills'] != null ? List<Skills>.from((map['skills'] as List).map<Skills?>((x) => Skills.fromMap(x as Map),),) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResumeSchema.fromJson(String source) => ResumeSchema.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      basic,
      education,
      workExperience,
      projects,
      awards,
      certificates,
      publications,
      references,
      languages,
      skills
    ];
  }
}
