import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/controller/base_controller.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';

class LoginController extends GetxController with BaseController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isFormSubmitted = false.obs;

  void signIn() {
    isFormSubmitted.value = true;

    if (isFormSubmitted.value == true) {
      print('Login successful');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      Get.toNamed(Routes.CREATE_PIN);
    } else {
      print('Form validation failed');
    }
  }

  var isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
