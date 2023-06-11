import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reservations/app/home_page_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';

class BottomBarCurvedComponent extends GetWidget<HomePageController> {
  const BottomBarCurvedComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(
      builder: (controller) {
        return BottomNavigationBar(backgroundColor: Theme.of(context).cardColor,
          unselectedItemColor: Colors.black.withOpacity(.5),
          selectedItemColor: foreignColor,
          currentIndex: controller.index.value,
          unselectedFontSize:0,
          selectedFontSize:SizerUtil.deviceType == DeviceType.mobile ? 10:12,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            if(controller.pageController.hasClients){
  controller.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 50),
      curve: Curves.ease);
            }else
            {
              controller.pageController.initialPage;
            }
            controller.index.value = index;
            // controller.update();
          },
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Home.svg",
                color: controller.index.value == 0 ? context.theme.primaryColor : Colors.black.withOpacity(.5),
                height: SizerUtil.deviceType == DeviceType.mobile ? 18.sp : 15.sp,
                width: SizerUtil.deviceType == DeviceType.mobile ? 18.sp : 15.sp,
              ),
              label:TranslateText.home.tr,
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30.sp,
                width: 35.sp,padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(color: context.theme.backgroundColor,
                    borderRadius: BorderRadius.circular(6.0)),
                child:  Icon(Icons.account_circle_rounded),

              ),
              label: TranslateText.processes.tr
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Icon_user.svg",
                color: controller.index.value == 2 ? context.theme.primaryColor :  Colors.black.withOpacity(.5),
                height: SizerUtil.deviceType == DeviceType.mobile ? 17.sp : 15.sp,
                width: SizerUtil.deviceType == DeviceType.mobile ? 17.sp : 15.sp,
              ),
              label: TranslateText.profile.tr,
            ),
          ],
        );
      },
    );
  }
}
