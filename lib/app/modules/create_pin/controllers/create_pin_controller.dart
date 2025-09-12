import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_dialog_notif.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_colors.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class CreatePinController extends GetxController {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  RxString currentPin = ''.obs;

  void showSuccessDialog() {
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: CustomColor.netral1,
        child: CustomDialogNotif(
          autoCloseDuration: const Duration(milliseconds: 500),
          textStyleBody: AppTextStyles.regular14.copyWith(),
          assetIconPath: ConstantAsset.imgSuccess,
          title: 'Success!!',
          widthIcon: 64,
          bodyWidget: RichText(
            text: TextSpan(
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.colorNetral9,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'PIN "'),
                TextSpan(
                  // This is the part you want to make bold
                  text: currentPin.value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '" has been successfully created'),
              ],
            ),
          ),
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
      Get.offAllNamed(Routes.LOGIN_PIN);
    });
  }

  @override
  void onClose() {
    // Clean up controllers to prevent memory leaks
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
