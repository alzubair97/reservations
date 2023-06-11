// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/sized_circular_progress.dart';
import 'package:sizer/sizer.dart';

class DeleteDialog {
  Future<dynamic> buildDeleteDialog(
      BuildContext context, var controller, var deleteId,
      {String productId = "0", int unitid = 0, String type = "u"}) {
    return Get.defaultDialog(
        content: Icon(
          Icons.delete_outline,
          size: 30.sp,
          color: Colors.red.shade800,
        ),
        title: "سيتم الحذف للتاكيد",
        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                InkWell(onTap: (){
                  Get.back();
                },
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                        borderRadius: const BorderRadius.all(
                       Radius.circular(10),)
                    ),
                    child: Text("الغاء",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                InkWell(onTap:  () async {
                  if (productId != '0' && type == "p") {
                    await controller.delete(deleteId, productId);
                  } else if (productId != '0' && unitid != 0 && type == "u") {
                    await controller.delete(deleteId, productId, unitid);
                  } else if (type == "del") {
                    await controller.delete(deleteId);
                  }
                  Get.back();
                },
                  child: Container(
                    decoration: BoxDecoration(
                        color: red,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),)
                    ),
                    child: Obx(() => controller.isLoading.value
                        ? sizedCircularProgress()
                        : Text("موافق",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))),
                  ),
                ),
              ],
            ),
          )
        ],
        titleStyle: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontSize: 10.sp, color: mainColor));
  }
}
