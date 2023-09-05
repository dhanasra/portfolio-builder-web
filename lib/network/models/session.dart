
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class UserSession {
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? refreshToken;

  UserSession(this.accessToken, this.refreshToken);
}
