import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_wavy_clipper.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

import '../controllers/login_pin_controller.dart';

class LoginPinView extends GetView<LoginPinController> {
  const LoginPinView({super.key});
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
                    const SizedBox(height: 50),
                    const CustomImageLocal(
                      imagePath: ConstantAsset.logoLppom,
                      height: 44,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 78),
                    Obx(
                      () => PinDots(
                        pinLength: controller.pinLength,
                        currentPinLength: controller.pin.value.length,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Enter your PIN',
                      style: AppTextStyles.regular14.copyWith(
                        color: CustomColor.netral9,
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PIN);
                      },
                      child: Text(
                        'Forgot Pin',
                        style: AppTextStyles.semiBold14.copyWith(
                          color: CustomColor.blue600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    NumericKeypad(onKeyPressed: controller.onKeyPressed),
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
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? Colors.deepPurple : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}

class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyPressed;

  const NumericKeypad({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        _buildRow(['4', '5', '6']),
        _buildRow(['7', '8', '9']),
        _buildRow(['', '0', 'X']),
      ],
    );
  }

  Widget _buildRow(List<String> values) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values.map((value) {
          if (value.isEmpty) {
            return const SizedBox(width: 44, height: 44);
          }
          return _buildNumberButton(value);
        }).toList(),
      ),
    );
  }

  Widget _buildNumberButton(String value) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Material(
        color: CustomColor.netral3,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => onKeyPressed(value),
          child: Center(child: Text(value, style: AppTextStyles.semiBold16)),
        ),
      ),
    );
  }
}
