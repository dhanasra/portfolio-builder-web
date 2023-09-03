// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:portfolio_builder_ai/network/models/location.dart';

class Basic extends Equatable {

  final String? name;
  final String? designation;
  final String? emailAddress;
  final String? phoneNumber;
  final String? summary;
  final Location? location;

  const Basic({
    this.name,
    this.designation,
    this.emailAddress,
    this.phoneNumber,
    this.summary,
    this.location,
  });

  Basic copyWith({
    String? name,
    String? designation,
    String? emailAddress,
    String? phoneNumber,
    String? summary,
    Location? location,
  }) {
    return Basic(
      name: name ?? this.name,
      designation: designation ?? this.designation,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      summary: summary ?? this.summary,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'designation': designation,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'summary': summary,
      'location': location?.toMap(),
    };
  }

  factory Basic.fromMap(map) {
    return Basic(
      name: map['name'] != null ? map['name'] as String : null,
      designation: map['designation'] != null ? map['designation'] as String : null,
      emailAddress: map['emailAddress'] != null ? map['emailAddress'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      location: map['location'] != null ? Location.fromMap(map['location'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Basic.fromJson(String source) => Basic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name??'',
      designation??'',
      emailAddress??'',
      phoneNumber??'',
      summary??'',
      location??'',
    ];
  }
}
