// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {

  final String firstName;
  final String lastName;
  final String email;
  final bool emailVerified;
  final String uid;
  final String? picture;
  final bool customPicture;
  final String lastLogin;
  final String created;
  final String updated;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.uid,
    this.picture,
    required this.customPicture,
    required this.lastLogin,
    required this.created,
    required this.updated,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? emailVerified,
    String? uid,
    String? picture,
    bool? customPicture,
    String? lastLogin,
    String? created,
    String? updated,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      uid: uid ?? this.uid,
      picture: picture ?? this.picture,
      customPicture: customPicture ?? this.customPicture,
      lastLogin: lastLogin ?? this.lastLogin,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'emailVerified': emailVerified,
      'uid': uid,
      'picture': picture,
      'customPicture': customPicture,
      'lastLogin': lastLogin,
      'created': created,
      'updated': updated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      emailVerified: map['emailVerified'] as bool,
      uid: map['uid'] as String,
      picture: map['picture'] != null ? map['picture'] as String : null,
      customPicture: map['customPicture'] as bool,
      lastLogin: map['lastLogin'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      emailVerified,
      uid,
      picture??'',
      customPicture,
      lastLogin,
      created,
      updated,
    ];
  }
}
