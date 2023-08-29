// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Project extends Equatable {

  final String? name;
  final String? description;
  final List? technologiesUsed;
  final String? url;

  const Project({
    this.name,
    this.description,
    this.technologiesUsed,
    this.url,
  });


  Project copyWith({
    String? name,
    String? description,
    List? technologiesUsed,
    String? url,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
      technologiesUsed: technologiesUsed ?? this.technologiesUsed,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'technologiesUsed': technologiesUsed,
      'url': url,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      technologiesUsed: map['technologies_used'] != null ? List.from((map['technologies_used'] as List)) : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
