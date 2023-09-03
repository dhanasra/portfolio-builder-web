// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Project extends Equatable {

  final String? name;
  final String? description;
  final String? startDate;
  final String? endDate;
  final String? highlight;
  final List? technologiesUsed;
  final String? url;

  const Project({
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.highlight,
    this.technologiesUsed,
    this.url,
  });

  Project copyWith({
    String? name,
    String? description,
    String? startDate,
    String? endDate,
    String? highlight,
    List? technologiesUsed,
    String? url,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      highlight: highlight ?? this.highlight,
      technologiesUsed: technologiesUsed ?? this.technologiesUsed,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'highlight': highlight,
      'technologiesUsed': technologiesUsed,
      'url': url,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
      highlight: map['highlight'] != null ? map['highlight'] as String : null,
      technologiesUsed: map['technologiesUsed'] != null ? map['technologiesUsed'] as List : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name??'',
      description??'',
      startDate??'',
      endDate??'',
      highlight??'',
      technologiesUsed??'',
      url??'',
    ];
  }
}
