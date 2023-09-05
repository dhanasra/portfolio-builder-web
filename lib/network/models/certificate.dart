// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Certificate extends Equatable {

  final String? name;
  final String? date;
  final String? issuer;
  final String? url;

  const Certificate({
    this.name,
    this.date,
    this.issuer,
    this.url,
  });


  Certificate copyWith({
    String? name,
    String? date,
    String? issuer,
    String? url,
  }) {
    return Certificate(
      name: name ?? this.name,
      date: date ?? this.date,
      issuer: issuer ?? this.issuer,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'date': date,
      'issuer': issuer,
      'url': url,
    };
  }

  factory Certificate.fromMap(map) {
    return Certificate(
      name: map['name'] != null ? map['name'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      issuer: map['issuer'] != null ? map['issuer'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Certificate.fromJson(String source) => Certificate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name??'', date??'', issuer??'', url??''];
}
