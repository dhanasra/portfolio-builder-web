// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:portfolio_builder_ai/network/models/resume_schema.dart';

class Resume extends Equatable {

  final String id;
  final String name;
  final String? link;
  final String? parsed;
  final String? content;
  final ResumeSchema? schema;
  final String userId;
  final String created;
  final String updated;

  const Resume({
    required this.id,
    required this.name,
    this.link,
    this.parsed,
    this.content,
    this.schema,
    required this.userId,
    required this.created,
    required this.updated,
  });

  Resume copyWith({
    String? id,
    String? name,
    String? link,
    String? parsed,
    String? content,
    ResumeSchema? schema,
    String? userId,
    String? created,
    String? updated,
  }) {
    return Resume(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      parsed: parsed ?? this.parsed,
      content: content ?? this.content,
      schema: schema ?? this.schema,
      userId: userId ?? this.userId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'parsed': parsed,
      'content': content,
      'schema': schema?.toMap(),
      'userId': userId,
      'created': created,
      'updated': updated,
    };
  }

  String toJson() => json.encode(toMap());

  factory Resume.fromJson(String source) => Resume.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      link??'',
      parsed??'',
      content??'',
      schema??'',
      userId,
      created,
      updated,
    ];
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['_id'] as String,
      name: map['name'] as String,
      link: map['link'] != null ? map['link'] as String : null,
      parsed: map['parsed'] != null ? map['parsed'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      schema: map['schema'] != null ? ResumeSchema.fromMap(map['schema'] as Map<String,dynamic>) : null,
      userId: map['userId'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
    );
  }
}
