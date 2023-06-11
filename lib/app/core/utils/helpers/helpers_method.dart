// ignore_for_file: deprecated_member_use

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/global_widgets/get_bottom_sheet.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/snakbar/erorr.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpersMethods {
  Duration timeOutDuration({int seconds = 5}) {
    return Duration(seconds: seconds);
  }

  hideSoftKeyBoard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static TextDirection currentLocaleTextDirection() {
    bool isRtl = intl.Bidi.isRtlLanguage(
        Localizations.localeOf(Get.context!).languageCode);
    return isRtl ? TextDirection.rtl : TextDirection.ltr;
  }

  static bool isDirectionRTL() {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(Get.context!).languageCode);
  }

  static getDate(
      {required TextEditingController txtController,
      required String title,
      DateTime? minDate,
      DateTime? maxDate,
      Function(dynamic)? onChange}) {
    FocusScope.of(Get.context!).unfocus();
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(bottom: 1.h),
        child: BottomPicker.date(
          height: Get.height / 2.2,
          title: title.tr,
          backgroundColor: Colors.transparent,
          titleStyle: AppTextStyleTheme.titlePartText,
          pickerTextStyle: AppTextStyleTheme.inputText,
          minDateTime: minDate,
          maxDateTime: maxDate,
          buttonText: TranslateText.confirmation.tr,
          buttonTextStyle: AppTextStyleTheme.textButton,
          gradientColors: [
            Get.theme.primaryColor.withOpacity(0.5),
            Get.theme.primaryColor.withOpacity(0.8)
          ],
          onSubmit: (val) {
            if (onChange != null) {
              onChange(val);
            } else {
              txtController.text = intl.DateFormat('yyyy-MM-dd').format(val).toString();
            }
          },
        ),
      ),
      backgroundColor: Get.theme.cardColor,
    );
  }

   getTime(
      {required String title, required TextEditingController txtController,}) {
    BottomPicker.time(
      title: title,
      titleStyle: AppTextStyleTheme.titlePartText,
      pickerTextStyle: AppTextStyleTheme.inputText,
      gradientColors: [
        Get.theme.primaryColor.withOpacity(0.5),
        Get.theme.primaryColor.withOpacity(0.8)
      ],
      bottomPickerTheme: BottomPickerTheme.blue,
      buttonText: TranslateText.confirmation.tr,
      buttonTextStyle: AppTextStyleTheme.textButton,
      onSubmit: (val) {
        // txtController.text = intl.DateFormat('KK:mm  a').format(val).toString();
        txtController.text = intl.DateFormat('hh:mm:ss').format(val).toString();
      },
    ).show(Get.context!);
  }
  static Future<String> getItem(String item)async{
    return item;
  }

  static Future<String> getImage({required ImageSource imageSource}) async {
    String selectImagePath = '';
    try {
      final pickImage = await ImagePicker().pickImage(source: imageSource);
      if (pickImage != null) {
        selectImagePath = pickImage.path.toString();
      } else {
        showSnakBarError(msg: TranslateText.imageNotSelectImage);
      }
    } catch (e) {
      showSnakBarError(msg: TranslateText.imageNotSelectImage);
    }
    if (selectImagePath.isEmpty) {
      showSnakBarError(msg: TranslateText.imageNotSelectImage);
    }

    return selectImagePath;
  }

  static Future<void> callLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw TranslateText.canNotAccessTo + url.toString();
    }
  }

  static String fillList({int? id, required Rx<List> dataList}) {
    if (id != null && dataList.value.isNotEmpty) {
      int index = dataList.value.indexWhere((element) => element.id == id);
      if (index >= 0) {
        var dataSelect = dataList.value[index];
        dataList.value.remove(dataSelect);
        dataList.value.insert(0, dataSelect);
        return dataList.value[0].name.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }
}
