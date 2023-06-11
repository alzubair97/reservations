import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/base_controller/local_storage/get_user_selected_theme_storge.dart';
import 'package:reservations/app/core/theme/color.dart';
import 'package:reservations/app/splash_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:sizer/sizer.dart';
import 'package:reservations/style/color.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (splashControl) {
      return SplashScreenView(
        navigateRoute: splashControl.checkFirstSeen(),
        duration: 5000,
        imageSize: 130,
        imageSrc: !UserSelectedThemeStorage.isDark
            ? "assets/img/logo.png"
            : "assets/img/whiteLogo.png",
        text: TranslateText.welcome.tr,
        textType: TextType.ColorizeAnimationText,
        textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontSize: 20.sp,
            ),
        colors: [
          Theme.of(context).primaryColor,
          Colors.white,
          foreignColor,
          Colors.black,
        ],
        backgroundColor: !UserSelectedThemeStorage.isDark
            ? Colors.white
            : DarkColor.background,
      );
    });
  
  }
}
