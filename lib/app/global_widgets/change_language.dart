import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';


class CustomChangeLanguage{

  showLanguage(){
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        decoration:  BoxDecoration(
          borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Get.theme.backgroundColor,
        ),
        child: Wrap(
          children: [
            SizedBox(
                width: double.infinity,
                child: CustomText(text: TranslateText.language,alignText: TextAlign.center ,txtStyle: AppTextStyleTheme.largeTxtBld,)),
            Divider(endIndent: 30.w,indent:30.w),
            ListTile(
              title: CustomText(text:TranslateText.arabic,txSize: 10.sp),
              leading:   Icon(Icons.language,color:Get.theme.primaryColor),
              onTap: () {
                Get.updateLocale(const Locale('ar'));
                Get.back();
              },
            ),
            Divider(),
            ListTile(
              title: CustomText(text:TranslateText.english,txSize: 10.sp),
              leading:   Icon(Icons.language,color: Get.theme.primaryColor,),
              onTap: () {
                Get.updateLocale(const Locale('en'));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}