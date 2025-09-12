import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_button.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_dialog_confirmation.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_wavy_clipper.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';
import 'package:pinput/pinput.dart';

import '../controllers/create_pin_controller.dart';

class CreatePinView extends GetView<CreatePinController> {
  const CreatePinView({super.key});
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 80),
                    const CustomImageLocal(
                      imagePath: ConstantAsset.logoLppom,
                      height: 44,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 47),
                    const Text('Create Your Pin',
                        style: AppTextStyles.semiBold24),
                    const SizedBox(height: 24),
                    Pinput(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        controller.currentPin.value = value;
                      },
                      animationDuration: const Duration(milliseconds: 100),
                      length: 5,
                      controller: controller.pinController,
                      focusNode: controller.focusNode,
                      defaultPinTheme: PinTheme(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 49,
                        height: 46,
                        textStyle: AppTextStyles.regular16.copyWith(
                          color: CustomColor.netral8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.grey100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        textStyle: AppTextStyles.regular16.copyWith(
                          color: CustomColor.newPrimary,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.newPrimary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomButton(
                          isEnabled: controller.currentPin.value.length == 5
                              ? true
                              : false,
                          backgroundColor:
                              controller.currentPin.value.length == 5
                                  ? CustomColor.blue400
                                  : CustomColor.grey100,
                          gradientColors: const [Colors.blue, Colors.purple],
                          isGradient: controller.currentPin.value.length == 5
                              ? true
                              : false,
                          label: 'Create',
                          width: double.infinity,
                          height: 44,
                          borderRadius: 8,
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
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
                                        'Are you sure about the PIN you entered?',
                                    buttonTextNegative: 'Cancel',
                                    buttonTextPositive: 'Yes, Confirm',
                                    title: 'Confirm!!',
                                    widthIcon: 60,
                                    onButtonPressedPostive: () {
                                      Get.back();
                                      controller.showSuccessDialog();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
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
        ],
      ),
    );
  }
}

class PinDots extends StatelessWidget {
  final int pinLength;
  final int currentPinLength;

  const PinDots({
    super.key,
    required this.pinLength,
    required this.currentPinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        bool isFilled = index < currentPinLength;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? const Color(0xFF4A90E2) : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}
