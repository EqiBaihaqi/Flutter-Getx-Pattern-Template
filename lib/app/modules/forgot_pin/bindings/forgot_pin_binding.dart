import 'package:get/get.dart';

import '../controllers/forgot_pin_controller.dart';

class ForgotPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPinController>(
      () => ForgotPinController(),
    );
  }
}
