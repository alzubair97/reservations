import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UiHelperSize {
  UiHelperSize._();
  static  late final double heightQuarter;
  static  late final double heightThird;
  static  late final double heightHalf;
  static  late final double height2Third;
  static  late final double height;
  static  late final double h10;
  static  late final double h15;
  static  late final double h20;
  //........................................................................
  static  late final double widthQuarter;
  static  late final double widthThird;
  static  late final double widthHalf;
  static  late final double width2Third;
  static  late final double width;
  static  late final double w10;
  static  late final double w15;
  static  late final double w20;
  //........................................................................
  static  late final SizedBox sizedBox1w;
  static  late final SizedBox sizedBox2w;
  static  late final SizedBox sizedBox4w;
  static  late final SizedBox sizedBox8w;
  static  late final SizedBox sizedBox16w;
  static  late final SizedBox sizedBox24w;
  static  late final SizedBox sizedBox32w;
  //........................................................................
  static  late final SizedBox sizedBox1h;
  static  late final SizedBox sizedBox2h;
  static  late final SizedBox sizedBox3h;
  static  late final SizedBox sizedBox4h;
  static  late final SizedBox sizedBox8h;
  static  late final SizedBox sizedBox16h;
  static  late final SizedBox sizedBox24h;
  static  late final SizedBox sizedBox32h;
//........................................................................

 static getAllUiHelperSize(){
   heightQuarter=Get.height/4;
   heightThird=Get.height/3;
   heightHalf=Get.height/2;
   height2Third=Get.height/1.5;
   height=Get.height;
   h10=10.h;
   h15=15.h;
   h20=20.h;
  //........................................................................
   widthQuarter=Get.width/4;
   widthThird=Get.width/3;
   widthHalf=Get.width/2;
   width2Third=Get.width/1.5;
   width=Get.width;
   w10=10.w;
   w15=15.w;
   w20=20.w;
  //........................................................................
   sizedBox1w = SizedBox(width: 1.0.w);
   sizedBox2w = SizedBox(width: 2.0.w);
   sizedBox4w = SizedBox(width: 4.0.w);
   sizedBox8w = SizedBox(width: 8.0.w);
   sizedBox16w = SizedBox(width: 16.0.w);
   sizedBox24w = SizedBox(width: 24.0.w);
   sizedBox32w = SizedBox(width: 32.0.w);
  //........................................................................
   sizedBox1h = SizedBox(height: 1.0.h);
   sizedBox2h = SizedBox(height: 2.0.h);
   sizedBox3h = SizedBox(height: 3.0.h);
   sizedBox4h = SizedBox(height: 4.0.h);
   sizedBox8h = SizedBox(height: 8.0.h);
   sizedBox16h = SizedBox(height: 16.0.h);
   sizedBox24h = SizedBox(height: 24.0.h);
   sizedBox32h = SizedBox(height: 32.0.h);
}

}