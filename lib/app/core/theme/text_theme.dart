import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyleTheme {
  AppTextStyleTheme._();
  static TextStyle small = Get.textTheme.headline1!;
  static TextStyle get titleScreenText => Get.textTheme.subtitle1!;
  static TextStyle get titlePartText => Get.textTheme.bodyText1!;
  static TextStyle get inputText =>
      Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.normal);
  static TextStyle get largeTextView => Get.textTheme.headline6!;
  static TextStyle get madelTextView => Get.textTheme.headline5!;
  static TextStyle get smallTextView => Get.textTheme.headline4!;
  static TextStyle get tapBar => Get.textTheme.headline2!;
  static TextStyle get categoryName =>
      Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get productName =>
      Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get productPrise => Get.textTheme.bodyText1!;
  static TextStyle get productDescription => Get.textTheme.headline5!;
  static TextStyle get textActionBtn => Get.textTheme.headline6!
      .copyWith(color: Get.theme.indicatorColor, fontWeight: FontWeight.bold);
  static TextStyle get textIconBtn => Get.textTheme.headline6!
      .copyWith(color: Get.theme.indicatorColor, fontWeight: FontWeight.bold);
  static TextStyle get textButton => Get.textTheme.headline5!
      .copyWith(fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle get superSmallTxtBld =>
      Get.textTheme.headline2!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get superSmallTxtNor => Get.textTheme.headline2!;
  static TextStyle get smallTxtBld =>
      Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get smallTxtNor => Get.textTheme.headline3!;

  static TextStyle get madelTxtBld =>
      Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get madelTxtNor => Get.textTheme.headline4!;
  static TextStyle get largeTxtBld =>
      Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get largeTxtNor => Get.textTheme.headline5!;
  static TextStyle get supLargeTxtBld =>
      Get.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get appParTxtBld =>
      Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get supLargeTxtNor =>
      Get.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.normal);
}