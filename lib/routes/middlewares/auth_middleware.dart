import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder_ai/database/local_db.dart';
import '../app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {

    var refreshToken = LocalDB.getRefreshToken();

    if (refreshToken==null) {
      return null;
    }else {
      return const RouteSettings(name: Routes.splash);
    }
  }
}