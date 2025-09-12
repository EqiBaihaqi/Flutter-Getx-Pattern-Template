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

class ForgotPasswordConfirmation extends StatelessWidget {
  const ForgotPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.find<ForgotPasswordController>();
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
                        child: Text(
                          'New Passowrd',
                          style: AppTextStyles.semiBold14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Form(
                        key: controller.newPasswordFormKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              onChanged: (value) {
                                controller.validateNewPasswordForm();
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
                              controller: controller.newPasswordController,
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
                            SizedBox(height: 12),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Confirm New Passowrd',
                                style: AppTextStyles.semiBold14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              onChanged: (value) {
                                controller.validateNewPasswordForm();
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
                              controller:
                                  controller.confirmNewPasswordController,
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
                                (value) {
                                  if (value !=
                                      controller.newPasswordController.text) {
                                    return 'Password is not match';
                                  }
                                  return null;
                                },
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => CustomButton(
                          isEnabled: controller.isFormNewPasswordValid.value,
                          label: 'Update Password',
                          width: double.infinity,
                          textColor: controller.isFormNewPasswordValid.value
                              ? CustomColor.netral1
                              : CustomColor.netral7,
                          textStyle: AppTextStyles.semiBold14,
                          backgroundColor:
                              controller.isFormNewPasswordValid.value
                                  ? CustomColor.blue400
                                  : CustomColor.grey100,
                          isGradient: controller.isFormNewPasswordValid.value,
                          gradientColors: const [
                            CustomColor.blueGradient,
                            CustomColor.purpleGradient,
                          ],
                          onPressed: () {
                            if (controller.newPasswordFormKey.currentState!
                                .validate()) {
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
                                        'Are you sure about the password you\nentered?',
                                    buttonTextNegative: 'Cancel',
                                    buttonTextPositive: 'Yes, Update',
                                    title: 'Confirm!!',
                                    widthIcon: 60,
                                    onButtonPressedPostive: () {
                                      Get.back();
                                      Get.offAllNamed(Routes.LOGIN_PIN);
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
