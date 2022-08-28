import 'package:get/get.dart';

import '../controllers/market_page_controller.dart';

class MarketPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketPageController>(
      () => MarketPageController(),
    );
  }
}
