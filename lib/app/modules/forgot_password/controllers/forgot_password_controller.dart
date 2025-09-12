import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/controller/base_controller.dart';

class ForgotPasswordController extends GetxController with BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  var isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  final newPasswordFormKey = GlobalKey<FormState>();
  var isFormNewPasswordValid = false.obs;

  void validateNewPasswordForm() {
    isFormNewPasswordValid.value =
        newPasswordFormKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}


