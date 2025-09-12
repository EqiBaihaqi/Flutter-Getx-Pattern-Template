import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_button.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_wavy_clipper.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomImageLocal(
              imagePath: ConstantAsset.imgBackgroundPattern,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 83, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Go Ahead and Setup\nYour Account',
                    style: AppTextStyles.semiBold20.copyWith(
                      color: CustomColor.netral1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Sign In to enjoy the best managing experience',
                    style: AppTextStyles.regular12.copyWith(
                      color: CustomColor.netral1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipPath(
              clipper: CustomWavyClipper(),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      const CustomImageLocal(
                        imagePath: ConstantAsset.logoLppom,
                        height: 44,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 47),
                      Form(
                        key: controller.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SIGN IN',
                                style: AppTextStyles.semiBold18),
                            const SizedBox(height: 24),
                            const Text('Email',
                                style: AppTextStyles.semiBold14),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              onChanged: (value) {
                                controller.validateForm();
                              },
                              isBorder: true,
                              hintText: 'ex. contoh@gmail.com',
                              isFilled: true,
                              fillColor: CustomColor.netral3,
                              errorFillColor: CustomColor.netral1,
                              borderColor: CustomColor.netral3,
                              hintStyle: AppTextStyles.regular14.copyWith(
                                color: CustomColor.netral6,
                              ),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: CustomColor.netral6,
                              ),
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              errorTextStyle: AppTextStyles.regular12.copyWith(
                                color: CustomColor.green500,
                              ),
                              validations: [
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Text Field';
                                  }
                                  return null;
                                },
                                (value) {
                                  final emailRegex = RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  );
                                  if (value != null &&
                                      value.isNotEmpty &&
                                      !emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Password',
                                style: AppTextStyles.semiBold14),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              onChanged: (value) {
                                controller.validateForm();
                              },
                              isBorder: true,
                              hintText: 'Input password',
                              isFilled: true,
                              fillColor: CustomColor.netral3,
                              errorFillColor: CustomColor.netral1,
                              borderColor: CustomColor.netral3,
                              hintStyle: AppTextStyles.regular14.copyWith(
                                color: CustomColor.netral6,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: CustomColor.netral6,
                              ),
                              controller: controller.passwordController,
                              isPassword: true,
                              errorTextStyle: AppTextStyles.regular12.copyWith(
                                color: CustomColor.green500,
                              ),
                              validations: [
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Text Field';
                                  }
                                  return null;
                                },
                                (value) {
                                  if (value != null &&
                                      value.isNotEmpty &&
                                      value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.regular12.copyWith(
                              color: CustomColor.netral8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => CustomButton(
                          isEnabled: controller.isFormValid.value,
                          label: 'Sign In',
                          width: double.infinity,
                          textColor: controller.isFormValid.value
                              ? CustomColor.netral1
                              : CustomColor.netral7,
                          textStyle: AppTextStyles.semiBold14,
                          backgroundColor: controller.isFormValid.value
                              ? CustomColor.blue400
                              : CustomColor.grey100,
                          isGradient: controller.isFormValid.value,
                          gradientColors: const [
                            CustomColor.blueGradient,
                            CustomColor.purpleGradient,
                          ],
                          onPressed: () {
                            controller.signIn();
                          },
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copyright),
                          SizedBox(width: 8),
                          Text(
                            '2025 LPPOM. All rights reserved.',
                            style: AppTextStyles.regular12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
