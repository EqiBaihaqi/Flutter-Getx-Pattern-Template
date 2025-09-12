import 'package:get/get.dart';

import '../controllers/price_simulation_controller.dart';

class PriceSimulationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceSimulationController>(
      () => PriceSimulationController(),
    );
  }
}
