import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/routes/app_pages.dart';

class LoginPinController extends GetxController {
  final int pinLength = 5;

  var pin = ''.obs;

  void onKeyPressed(String value) {
    if (value == 'X') {
      if (pin.value.isNotEmpty) {
        pin.value = pin.value.substring(0, pin.value.length - 1);
      }
    } else if (pin.value.length < pinLength) {
      pin.value += value;
    }

    if (pin.value.length == pinLength) {
      print('PIN entered: ${pin.value}');
      Get.offAllNamed(Routes.HOME);
    }
  }
}
