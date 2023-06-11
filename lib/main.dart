import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservations/app/base_controller/local_storage/get_user_selected_theme_storge.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:reservations/app/data/inter_net_checker.dart';
import 'package:reservations/app/routes/pages.dart';
import 'package:reservations/app/routes/routes.dart';
import 'package:reservations/app/splash.dart';
import 'package:reservations/bindings/home_buinding.dart';
import 'package:reservations/langange/locale_string.dart';
import 'package:sizer/sizer.dart';
void main() async {
  await GetStorage.init();
  await UserSelectedThemeStorage().getValueMode();
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade200,
      statusBarBrightness: Brightness.dark // status bar color
  ));
  HttpOverrides.global = MyHttpOverrides();
  Get.put(CheckInterNet(), permanent: true);

  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GlobalLoaderOverlay(
      overlayColor: Get.theme.hoverColor.withOpacity(0.2),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 200),
        translations: LocaleString(),
        locale: const Locale("ar"),
        fallbackLocale: const Locale('ar'),
        builder: DevicePreview.appBuilder,
        theme: ThemeService.lightTheme,
        darkTheme: ThemeService.darkTheme,
        themeMode: ThemeMode.light,
        getPages: AppPages.pages,
        defaultTransition: Transition.fadeIn,
        initialBinding: SplashBinding(),
        initialRoute: Routes.splash,
        unknownRoute: GetPage(
          name: Routes.splash,
          page: () => const Splash(),
        ),
      ),
    );
  }));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // await ServiceAPI.setup();
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
  }
}