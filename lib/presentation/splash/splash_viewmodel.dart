import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/database/local_db.dart';
import 'package:portfolio_builder_ai/routes/app_routes.dart';

class SplashViewModel extends BaseViewModel {

  final BuildContext context;
  SplashViewModel(this.context);

  @override
  void initialize() {

    Future.delayed(const Duration(seconds: 2),(){
      if(LocalDB.getAccessToken()!=null && LocalDB.getRefreshToken()!=null){
        Get.offAndToNamed(Routes.uploadResume);
      }else{
        Get.offAndToNamed(Routes.signin);
      }
    });
  }

  @override
  void dispose() {

  }

}