import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/langange/string.dart';

class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> globalKey = GlobalKey();
  late RxBool showPass=true.obs;
  TextEditingController password =TextEditingController();
  TextEditingController confirmPassword =TextEditingController();

  showPassFun() {
    showPass.toggle();
    update();
  }
  String? validateConfirmPassword(
      TextEditingController password, String confirmPassword) {
    return password.text.trim() != confirmPassword.trim()
        ? TranslateText.confirmPasswordValidateError.tr
        : null;
  }

  String? validatePassword(String value) {
    if (value.startsWith(' ')) {
      return TranslateText.canNotStartWithSpace + ' ' + TranslateText.password;
    } else if (value.endsWith(' ')) {
      return TranslateText.canNotEndWithSpace + ' ' + TranslateText.password;
    }
    return null;
  }
}