import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reservations/app/core/utils/const/image_path.dart';
import 'package:sizer/sizer.dart';

class UiHelper {
  UiHelper._();
  static SizedBox sizedBox1w = SizedBox(width: 1.0.w);
  static SizedBox sizedBox2w = SizedBox(width: 2.0.w);
  static SizedBox sizedBox4w = SizedBox(width: 4.0.w);
  static SizedBox sizedBox8w = SizedBox(width: 8.0.w);
  static SizedBox sizedBox16w = SizedBox(width: 16.0.w);
  static SizedBox sizedBox24w = SizedBox(width: 24.0.w);
  static SizedBox sizedBox32w = SizedBox(width: 32.0.w);
  //........................................................................
  static SizedBox sizedBox1h = SizedBox(height: 1.0.h);
  static SizedBox sizedBox2h = SizedBox(height: 2.0.h);
  static SizedBox sizedBox4h = SizedBox(height: 4.0.h);
  static SizedBox sizedBox8h = SizedBox(height: 8.0.h);
  static SizedBox sizedBox16h = SizedBox(height: 16.0.h);
  static SizedBox sizedBox24h = SizedBox(height: 24.0.h);
  static SizedBox sizedBox32h = SizedBox(height: 32.0.h);
//........................................................................


  // static Widget spinKitProgressIndicator({double size = 50.0, Color? color}) {
  //   return SpinKitRipple(
  //     color: color ?? Get.theme.primaryColor,
  //     size: size,
  //   );
  // }

  static Widget loadingAnimation() {
    return Center(
      child: Container(
          child: Lottie.asset(AppImages.animationLoading,
              fit: BoxFit.cover, width: 60, height: 60)),
    );
  }



}