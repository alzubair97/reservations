import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

showSnakBarSuccess({required String msg}) {
  Get.showSnackbar(GetSnackBar(
    icon: CircleAvatar(
      backgroundColor: Colors.green.shade700,
      radius: 15.sp,
      child: Icon(
        Icons.task_alt,
        color: Colors.white,
        size: 15.sp,
      ),
    ),
    // title: "Done",
    titleText: const SizedBox(),
    // message: msg,
    messageText: Text(
      msg.tr,
      style: Theme.of(Get.context!)
          .textTheme
          .overline!
          .copyWith(
          fontSize:12.sp,color: Colors.white, fontWeight: FontWeight.w600),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Colors.green,
    overlayBlur: 1,
    // barBlur: 2,
    dismissDirection: DismissDirection.horizontal,
  ));
}