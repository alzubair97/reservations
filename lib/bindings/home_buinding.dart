import 'package:get/get.dart';
import 'package:reservations/app/data/inter_net_checker.dart';
import 'package:reservations/app/home_page_controller.dart';
import 'package:reservations/app/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    // Get.put(GroupDataController(), permanent: true);
    Get.put(SplashController());
    Get.put(HomePageController());


    if (Get.find<CheckInterNet>().interNet.value) {
      Get.put(HomePageController());
    }
  }
}