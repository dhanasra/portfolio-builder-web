// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Reference extends Equatable {

  final String? name; 
  final String? position;
  final String? organization;
  final String? email;
  final String? phone;

  const Reference({
    this.name,
    this.position,
    this.organization,
    this.email,
    this.phone,
  });


  Reference copyWith({
    String? name,
    String? position,
    String? organization,
    String? email,
    String? phone,
  }) {
    return Reference(
      name: name ?? this.name,
      position: position ?? this.position,
      organization: organization ?? this.organization,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'position': position,
      'organization': organization,
      'email': email,
      'phone': phone,
    };
  }

  factory Reference.fromMap(Map<String, dynamic> map) {
    return Reference(
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      organization: map['organization'] != null ? map['organization'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reference.fromJson(String source) => Reference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name??'',
      position??'',
      organization??'',
      email??'',
      phone??'',
    ];
  }
}
