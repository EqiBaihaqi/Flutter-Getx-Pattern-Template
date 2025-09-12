import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_button.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_dialog_confirmation.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_wavy_clipper.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
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
              clipper: CustomWavyClipper(), // Using the custom clipper
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 80),
                      const CustomImageLocal(
                        imagePath: ConstantAsset.logoLppom,
                        height: 44,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: CustomColor.blue500,
                                ),
                                Text(
                                  'Back',
                                  style: AppTextStyles.semiBold12.copyWith(
                                    color: CustomColor.blue500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          const Text(
                            'Forgot Password',
                            style: AppTextStyles.semiBold18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Email', style: AppTextStyles.semiBold14),
                      ),
                      const SizedBox(height: 8),
                      Form(
                        key: controller.formKey,
                        child: CustomTextFormField(
                          onChanged: (a) => controller.validateForm(),
                          controller: controller.emailController,
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
                          keyboardType: TextInputType.emailAddress,
                          errorBorderColor: Colors.red,
                          errorTextStyle: AppTextStyles.regular12.copyWith(
                            color: Colors.red,
                          ),
                          validations: [
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Input Text Field';
                              }
                              return null;
                            },
                            (value) {
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (value != null &&
                                  value.isNotEmpty &&
                                  !emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => CustomButton(
                          isEnabled: controller.isFormValid.value,
                          label: 'Send OTP',
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
                            if (controller.formKey.currentState!.validate()) {
                              Get.dialog(
                                Dialog(
                                  insetPadding: const EdgeInsets.all(24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: CustomColor.netral1,
                                  child: CustomDialogConfirmation(
                                    onButtonPressedNegative: () {
                                      Get.back();
                                    },
                                    assetIconPath: ConstantAsset.imgInfo,
                                    body:
                                        'Send OTP to this email address ${controller.emailController.text}?',
                                    buttonTextNegative: 'Cancel',
                                    buttonTextPositive: 'Yes, Send OTP',
                                    title: 'Confirm!!',
                                    widthIcon: 60,
                                    onButtonPressedPostive: () {
                                      Get.back();
                                      Get.toNamed(Routes.VERIFY_OTP);
                                    },
                                  ),
                                ),
                              );
                            }
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
