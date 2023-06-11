import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservations/app/core/contracts/controller.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:reservations/app/core/utils/helpers/helper_ui_app_size.dart';
import 'package:reservations/app/data/inter_net_checker.dart';
import 'package:reservations/app/data/service.dart';
import 'package:reservations/app/home.dart';
import 'package:reservations/app/view/first_open_for_app/first_screen.dart';

class SplashController extends ControllerClass {
  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(const Duration(milliseconds: 3000), () async {
      await ThemeService.getTheme();
      // await ServiceAPI.setup();
      await UiHelperSize.getAllUiHelperSize();
      update();
    });
  }

  Widget checkFirstSeen() {
    if (Get.find<CheckInterNet>().interNet.value) {
      if (GetStorage().read("login") == false || GetStorage().read("accessToken") == null ||
          Get.find<CheckInterNet>().interNet.value) {
        return HomePage();
      } else {
        return HomePage();
      }
    } else {
      return FirstOpenAppPage();
    }
  }
}
