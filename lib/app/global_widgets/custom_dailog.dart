import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/utils/const/image_path.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/buttons/custom.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

class CustomDialog {
  static deleteWarningDialog({Function()? deleteFun,String title=TranslateText.confirmationDelete}) {
    _customDialog(
      txt: title.tr,
      image:title==TranslateText.confirmationDelete.tr? AppImages.animationLoading:"",
      btn: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ActionButtonWthNoPrg(borderSize: 4,
                  onPressed: () {
                    if (deleteFun != null) {
                      deleteFun();
                      Get.back();
                    }
                  },
                  text: TranslateText.confirmation.tr),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
                child: CustomOutlinedButton(
              onPressed: () {
                Get.back();
              },
              text: TranslateText.cancel,
            )),
          ],
        ),
      ),
    );
  }

  static _customDialog(
      {required Widget btn,
      required String txt,
      required String image,
      double dialogHeight = 22}) {
    return Get.dialog(Stack(
      children: [
        Center(
          child: Container(
            width: 15.h,
            height: 15.h,
            margin: EdgeInsets.only(bottom: dialogHeight.h),
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: const Card(),
          ),
        ),
        Center(
          child: Card(
            // color: PrimaryLightGrey,
            child: Container(
              width: 80.w,
              height: dialogHeight.h,
              color: Get.theme.backgroundColor,
              padding: EdgeInsets.only(top: 7.h),
              child: Column(
                children: [
                  CustomText(text: txt, txSize: 14),
                  const Spacer(),
                  btn,
                  UiHelper.sizedBox2h,
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 15.h,
            height: 12.h,
            margin: EdgeInsets.only(bottom: dialogHeight.h),
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              shape: BoxShape.circle,
            ),
            child:image.isNotEmpty? Icon(
              Icons.delete,
              color: red,
              size: 30,
            ): const Icon(
              Icons.security_update_warning_sharp,
              color: Colors.red,
              size: 30,
            ),
            // child: Lottie.asset(image,fit: BoxFit.contain,height: 12.h),
          ),
        ),
      ],
    ));
  }
}
