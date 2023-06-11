import 'package:flutter/material.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

class NoInterNetConnection extends StatelessWidget {
  const NoInterNetConnection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi,
                size: 160,
                color: mainColor,
              ),
              // Expanded(child: Lottie.asset(AppImages.animationNoNetConnection,fit: BoxFit.fill,width: double.infinity)),
              // CustomText(text: TranslateText.noNetFond,txtFontWeight:FontWeight.bold, txSize: 14.sp,alignText: TextAlign.center,)
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              child: CustomText(
                text: TranslateText.noNetFond,
                txtFontWeight: FontWeight.bold,
                txSize: 14.sp,
                alignText: TextAlign.center,
              )),
        ],
      ),
    );
  }
}