import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/controller/base_controller.dart';

class ForgotPinController extends GetxController with BaseController {
  //TODO: Implement ForgotPinController
  TextEditingController passwordController = TextEditingController();
  var isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
