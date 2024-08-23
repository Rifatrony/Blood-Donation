import 'package:donate_blood/app/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final isLoading = false.obs;

  final isVisible = true.obs;

  final isRemembered = false.obs;
  final isError = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  checkValidation() {
    if(emailController.text.isEmpty){
      print("Write Email");
      return;
    }
    else if(passwordController.text.isEmpty){
      return;
    }

    else if(passwordController.text.length < 8){
      return;
    }

    else {
      userLogin();
    }
  }

  Future<dynamic> userLogin() async {
    print("Login Success");
    Get.toNamed(RouteName.homeRoute);
  }


}