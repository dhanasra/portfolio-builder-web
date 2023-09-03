// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {

  final String? address;
  final String? postalCode;
  final String? city;
  final String? state;
  final String? countryCode;
  final String? country;

  const Location({
    this.address,
    this.postalCode,
    this.city,
    this.state,
    this.countryCode,
    this.country,
  });

  Location copyWith({
    String? address,
    String? postalCode,
    String? city,
    String? state,
    String? countryCode,
    String? country,
  }) {
    return Location(
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      state: state ?? this.state,
      countryCode: countryCode ?? this.countryCode,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'postalCode': postalCode,
      'city': city,
      'state': state,
      'countryCode': countryCode,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      address: map['address'] != null ? map['address'] as String : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      countryCode: map['countryCode'] != null ? map['countryCode'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      address??'',
      postalCode??'',
      city??'',
      state??'',
      countryCode??'',
      country??'',
    ];
  }
}
