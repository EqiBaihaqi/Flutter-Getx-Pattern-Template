import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_button.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_wavy_clipper.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';
import 'package:pinput/pinput.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({super.key});
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 80),
                        const CustomImageLocal(
                          imagePath: ConstantAsset.logoLppom,
                          height: 44,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 47),
                        Text(
                          'Check Your Email',
                          style: AppTextStyles.semiBold24.copyWith(
                            color: CustomColor.netral9,
                          ),
                        ),
                        Text(
                          'Input the OTP sent to your email',
                          style: AppTextStyles.regular16.copyWith(
                            color: CustomColor.netral9,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Pinput(
                          controller: controller.otpPinController,
                          onChanged: (value) {
                            controller.otpPin.value = value;
                          },
                          animationDuration: const Duration(milliseconds: 100),
                          length: 6,
                          // focusNode: controller.focusNode,
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
                        const SizedBox(height: 12),
                        Obx(() {
                          // Only build the TimerCountdown if showTimer is true
                          if (controller.showTimer.value) {
                            return TimerCountdown(
                              endTime: controller.endTime.value,
                              format: CountDownTimerFormat.minutesSeconds,
                              enableDescriptions: false,
                              timeTextStyle: AppTextStyles.regular16.copyWith(
                                color: CustomColor.netral9,
                              ),
                              onEnd: controller.onTimerEnd,
                            );
                          } else {
                            // When the timer is hidden, show static text to prevent layout shifts
                            return Text(
                              "00  :  00",
                              style: AppTextStyles.regular16.copyWith(
                                color: CustomColor.netral9,
                              ),
                            );
                          }
                        }),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomButton(
                                label: 'Resend Code',
                                onPressed: () {
                                  controller.restartTimer();
                                },
                                isEnabled: controller.isTimerRunning.value
                                    ? false
                                    : true,
                                backgroundColor: controller.isTimerRunning.value
                                    ? CustomColor.grey100
                                    : CustomColor.red400,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomButton(
                                label: 'Verify',
                                onPressed: () {
                                  // If success
                                  controller.showSuccessDialog();
                                  // if failed
                                  // controller.showFailedDialog();
                                },
                                backgroundColor:
                                    controller.otpPin.value.length == 6
                                        ? CustomColor.newPrimary
                                        : CustomColor.grey100,
                                isGradient: controller.otpPin.value.length == 6
                                    ? true
                                    : false,
                                gradientColors: const [
                                  Colors.blue,
                                  Colors.purple
                                ],
                                isEnabled: controller.otpPin.value.length == 6
                                    ? true
                                    : false,
                              ),
                            ),
                          ],
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
          ),
        ],
      ),
    );
  }
}
