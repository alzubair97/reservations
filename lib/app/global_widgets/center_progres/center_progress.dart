import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';

class CenterProgress extends StatelessWidget {
  const CenterProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.context!.width,
      height: Get.context!.height,
      color: Colors.black12,
      child: SizedBox(
          width: 10.h,
          height: 10.h,
          child: LoadingIndicator(
            indicatorType: Indicator.squareSpin,
            backgroundColor: goldenColor.withOpacity(.2),
            colors: [mainColor],
          )),
    );
  }
}
