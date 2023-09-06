// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Site extends Equatable {

  final String id;
  final String name;
  final String link;
  final String status;
  final String templateId;
  final String resumeId;

  const Site({
    required this.id,
    required this.name,
    required this.link,
    required this.status,
    required this.templateId,
    required this.resumeId,
  });

  Site copyWith({
    String? id,
    String? name,
    String? link,
    String? status,
    String? templateId,
    String? resumeId,
  }) {
    return Site(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      status: status ?? this.status,
      templateId: templateId ?? this.templateId,
      resumeId: resumeId ?? this.resumeId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'status': status,
      'templateId': templateId,
      'resumeId': resumeId,
    };
  }

  factory Site.fromMap(Map<String, dynamic> map) {
    return Site(
      id: map['_id'] as String,
      name: map['name'] as String,
      link: map['link'] as String,
      status: map['status'] as String,
      templateId: map['templateId'] as String,
      resumeId: map['resumeId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Site.fromJson(String source) => Site.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      link,
      status,
      templateId,
      resumeId,
    ];
  }
} 
