import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/langange/string.dart';
import 'package:sizer/sizer.dart';

showSnakBarError({required String msg}) {
  Get.showSnackbar(GetSnackBar(
    icon: CircleAvatar(
      backgroundColor: Colors.red.shade700,
      radius: 15.sp,
      child: Icon(
        Icons.error_outline_outlined,
        color: Colors.white,
        size: 15.sp,
      ),
    ),
    titleText: const SizedBox(),
    messageText: Text(msg.length<600?
    msg.tr:TranslateText.error.tr,
      style: Theme.of(Get.context!)
          .textTheme
          .overline!
          .copyWith(fontSize: 10.sp,color: Colors.white, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.red,
    overlayBlur: 1,
    barBlur: 2,
    snackPosition:SnackPosition.BOTTOM,
    dismissDirection: DismissDirection.horizontal,
  ));
}