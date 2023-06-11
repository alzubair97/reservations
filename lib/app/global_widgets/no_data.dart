import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';

class NoData extends StatelessWidget {
  const NoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          "assets/img/addItem.png",
          height: 30.h,
          width: 30.w,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          TranslateText.noData.tr,
          textAlign: TextAlign.center,
          style: TextStyle(color: mainColor),
        )
      ],
    );
  }
}

class NoDataFoundSpinner extends StatelessWidget {
  const NoDataFoundSpinner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         // Icon(Icons.noData),
          Text(TranslateText.noDataFound.tr,style: AppTextStyleTheme.smallTextView,)
        ],
      ),
    );
  }
}
