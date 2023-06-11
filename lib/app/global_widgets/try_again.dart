import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/helpers/responsbal_screen_size_helper.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/buttons/icon.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

class TryAgainSpinner extends StatelessWidget {
  const TryAgainSpinner({Key? key, required this.tryFun,this.errorMseg=TranslateText.unKnowError}) : super(key: key);
  final Function() tryFun;
  final String errorMseg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: errorMseg,alignText: TextAlign.center,
            txtFontWeight: FontWeight.bold,
            txtStyle: AppTextStyleTheme.largeTxtBld,
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: IconActionButton(
              onPressed: tryFun,
              icon: Icons.assistant_navigation,
              icnColor: goldenColor,
              icnSize: ResponsiveSize.isSmallScreen() ? 40 : 50,
            ),
          ),
        ],
      ),
    );
  }
}