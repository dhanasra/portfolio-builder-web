import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder_ai/database/local_db.dart';
import '../app_routes.dart';

class AuthMustMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {

    var accessToken = LocalDB.getAccessToken();
    var refreshToken = LocalDB.getAccessToken();

    if (accessToken != null && refreshToken!=null) {
      return null;
    }else {
      return const RouteSettings(name: Routes.splash);
    }
  }
}