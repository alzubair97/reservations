import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reservations/app/base_controller/api/login/login_api.dart';
import 'package:get/get.dart';
class LoginController extends LoginApi {
  PageController pageController = PageController();
  late RxBool showPass=true.obs;
  TextEditingController password = TextEditingController(),
      phoneNumber=TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();
  RxBool isLoginLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    phoneNumber = TextEditingController(text: kDebugMode ? '776010749' : null);
    password = TextEditingController(text: kDebugMode ? '1963' : null);
  }

  login() {
    if (loginKey.currentState!.validate()) {
      loginApiFun(
          isLoading: isLoginLoading,
          phoneNumber: phoneNumber.value.text.trim().toString(),
          pass: password.value.text.trim().toString());
    }
  }
}
