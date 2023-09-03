// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Award extends Equatable {

  final String? title;
  final String? date;
  final String? awarder;
  final String? summary;

  const Award({
    this.title,
    this.date,
    this.awarder,
    this.summary,
  });

  Award copyWith({
    String? title,
    String? date,
    String? awarder,
    String? summary,
  }) {
    return Award(
      title: title ?? this.title,
      date: date ?? this.date,
      awarder: awarder ?? this.awarder,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'awarder': awarder,
      'summary': summary,
    };
  }

  factory Award.fromMap(Map<String, dynamic> map) {
    return Award(
      title: map['title'] != null ? map['title'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      awarder: map['awarder'] != null ? map['awarder'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Award.fromJson(String source) => Award.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title??'', date??'', awarder??'', summary??''];
}
