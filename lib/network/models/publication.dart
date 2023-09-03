// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Publication extends Equatable {

  final String? name;
  final String? publisher;
  final String? releaseDate;
  final String? url;
  final String? summary;

  const Publication({
    this.name,
    this.publisher,
    this.releaseDate,
    this.url,
    this.summary,
  });


  Publication copyWith({
    String? name,
    String? publisher,
    String? releaseDate,
    String? url,
    String? summary,
  }) {
    return Publication(
      name: name ?? this.name,
      publisher: publisher ?? this.publisher,
      releaseDate: releaseDate ?? this.releaseDate,
      url: url ?? this.url,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'publisher': publisher,
      'releaseDate': releaseDate,
      'url': url,
      'summary': summary,
    };
  }

  factory Publication.fromMap(Map<String, dynamic> map) {
    return Publication(
      name: map['name'] != null ? map['name'] as String : null,
      publisher: map['publisher'] != null ? map['publisher'] as String : null,
      releaseDate: map['releaseDate'] != null ? map['releaseDate'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Publication.fromJson(String source) => Publication.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name??'',
      publisher??'',
      releaseDate??'',
      url??'',
      summary??'',
    ];
  }
}
