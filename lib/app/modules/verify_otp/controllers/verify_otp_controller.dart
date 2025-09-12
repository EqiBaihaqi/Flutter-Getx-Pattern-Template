import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_dialog_notif.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class VerifyOtpController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    endTime = DateTime.now().add(initialDuration).obs;
  }

  TextEditingController otpPinController = TextEditingController();
  // to fill text of otpPinController
  RxString otpPin = ''.obs;
  final Duration initialDuration = const Duration(seconds: 5);
  final showTimer = true.obs;

  late Rx<DateTime> endTime;
  Rx<bool> isTimerRunning = true.obs;

  void onTimerEnd() {
    isTimerRunning.value = false;
    showTimer.value = false;
  }

  void restartTimer() {
    endTime.value = DateTime.now().add(initialDuration);
    isTimerRunning.value = true;
    showTimer.value = true;
  }

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
          body: 'Your OTP has been successfully verified.',
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
      Get.toNamed(Routes.FORGOT_PASSWORD_CONFIRMATION);
    });
  }

  void showFailedDialog() {
    Get.dialog(Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: CustomColor.netral1,
      child: CustomDialogNotif(
        body: 'Please check your email and re-enter the OTP.',
        title: 'Incorrect Code',
        buttonText: 'Close',
        onButtonPressed: () => Get.back(),
        assetIconPath: ConstantAsset.imgFailed,
      ),
    ));
  }
}
