import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder_ai/base/base_viewmodel.dart';
import 'package:portfolio_builder_ai/presentation/authentication/bloc/auth_bloc.dart';
import 'package:portfolio_builder_ai/routes/app_routes.dart';
import 'package:portfolio_builder_ai/widgets/toast.dart';

class SignInViewModel extends BaseViewModel {

  final BuildContext context;
  SignInViewModel(this.context);

  @override
  void initialize() {
    
  }

  handleState(state){
    if(state is UserDataFetched){
      Get.toNamed(Routes.uploadResume);
    }else if(state is Failure){
      toast('Something wrong. Try again later', success: false);
    }
  }

  void signInClick(AuthEvent event){
    context.read<AuthBloc>().add(event);
  }

  @override
  void dispose() {

  }

}