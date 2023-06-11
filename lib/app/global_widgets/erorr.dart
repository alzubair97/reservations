// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnakBarErorr({required String msg, required color}) {
  Get.showSnackbar(GetBar(
    icon: const Icon(
      Icons.error_outline_outlined,
      color: Colors.white,
    ),
    title: "Messege",
    message: msg,
    duration: const Duration(seconds: 3),
    backgroundColor: color,
  ));
}
