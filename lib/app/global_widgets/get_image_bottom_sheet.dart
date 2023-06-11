import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/helpers_method.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

class CustomGetImageBottomSheet {
  getImage(Function(String imageSelect) imageFun) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Get.theme.cardColor,
      ),
      child: Wrap(
        children: [
          ListTile(
            title: CustomText(
                text: TranslateText.camera,
                txtStyle: AppTextStyleTheme.largeTxtBld
            ),
            leading: Icon(Icons.camera, color: goldenColor),
            onTap: () {
              Get.back();
              HelpersMethods.getImage(imageSource: ImageSource.camera).then((value) {
                imageFun(value);
              });
            },
          ),
          ListTile(
            title: CustomText(
                text: TranslateText.gallery, txtStyle: AppTextStyleTheme.largeTxtBld),
            leading: Icon(
              Icons.image,
              color: goldenColor,
            ),
            onTap: () {
              Get.back();
              HelpersMethods.getImage(imageSource: ImageSource.gallery)
                  .then((value) {
                imageFun(value);
              });
            },
          ),
        ],
      ),
    ));
  }
}