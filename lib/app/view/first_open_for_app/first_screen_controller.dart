import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/utils/const/image_path.dart';
import 'package:reservations/app/data/models/first_open_for_app.dart';
import 'package:reservations/langange/string.dart';
import 'package:page_indicator/page_indicator.dart';

class FirstScreenCon extends GetxController{
  GlobalKey<PageContainerState> key = GlobalKey();
  late PageController indicatorController;
  late RxInt index;

  late List<FirstOpenApp> firstOpenLst;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    index=0.obs;
    indicatorController = PageController();
    indicatorController.addListener(() {
      index.value=indicatorController.page!.toInt();
    });
    firstOpenLst=[
      FirstOpenApp(image:AppImages.animationFirstOpen3,title: TranslateText.title3,text: TranslateText.reports),
      FirstOpenApp(image:AppImages.animationFirstOpen2,title: TranslateText.title2,text: TranslateText.managementAndController),

      FirstOpenApp(image:AppImages.animationFirstOpen1,title: TranslateText.title1,text: TranslateText.support),

    ];
  }
}