import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/base_controller/local_storage/get_user_selected_theme_storge.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/global_widgets/buttons/icon.dart';
import 'package:reservations/app/global_widgets/change_language.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/routes/routes.dart';
import 'package:reservations/app/view/first_open_for_app/first_screen_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:reservations/style/color.dart';

class FirstOpenAppPage extends StatelessWidget {
   FirstOpenAppPage({Key? key}) : super(key: key);
  final _controller =Get.put(FirstScreenCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.cardColor,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40.0,bottom: 8),
              child: Row(
                children: [
                  IconActionButton(icon:Icons.language,onPressed:()=>CustomChangeLanguage().showLanguage())
                ],
              ),
            ),
            UiHelper.sizedBox8h,
            Image.asset(!UserSelectedThemeStorage.isDark
                ? "assets/img/logo.png"
                : "assets/img/whiteLogo.png",fit: BoxFit.contain,height: 22.h,width: Get.width),

            SizedBox(height: 22.h,child:PageIndicatorContainer(
              key: key,
              align: IndicatorAlign.bottom,
              length: _controller.firstOpenLst.length,
              indicatorSpace: 20.0,
              padding: const EdgeInsets.all(20),
              indicatorColor: Colors.black.withOpacity(0.2),
              // indicatorSelectorColor: Colors.white,
              shape: IndicatorShape.circle(size: 12),
              child: PageView(
                controller: _controller.indicatorController,
                reverse: true,
                children: _controller.firstOpenLst.map((element) =>customText(img:element.image,title:element.title,txt:element.text)
                ).toList(),
              ),
            ) ),
            // UiHelper.sizedBox8h,
            InkWell(onTap: (){
              Get.toNamed(Routes.login);
            },
              child: Container(
                margin:const EdgeInsets.symmetric(horizontal: 30,vertical: 8) ,
                color: Get.theme.primaryColor,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child:CustomText(text:  TranslateText.login,alignText: TextAlign.center,txtStyle: AppTextStyleTheme.textButton),
              ),
            ),
            UiHelper.sizedBox8h,
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                CustomText(text: TranslateText.byCratingAccountYouAgreeToOur.tr,txtStyle: AppTextStyleTheme.largeTxtBld,alignText: TextAlign.center,),
                CustomText(text: TranslateText.termsOfService.tr,txtStyle: AppTextStyleTheme.largeTxtBld.copyWith(color:Get.theme.primaryColor.withOpacity(.7)),alignText: TextAlign.center,),
                CustomText(text: TranslateText.and.tr,txtStyle: AppTextStyleTheme.largeTxtBld,alignText: TextAlign.center,),
                CustomText(text: TranslateText.privacyPolicy.tr,txtStyle: AppTextStyleTheme.largeTxtBld.copyWith(color:Get.theme.primaryColor.withOpacity(.7)),alignText: TextAlign.center,),

              ],
            ),

          ],
        ),
      ),
    );
  }
   Column customText({required String img, required String title, required String txt}){
    return Column(mainAxisAlignment: MainAxisAlignment.end,
      children:  <Widget>[

        Container(color: Get.theme.backgroundColor,
          width: double.infinity,margin: EdgeInsets.symmetric(horizontal:30),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomText(text: txt ,txtStyle: AppTextStyleTheme.supLargeTxtBld.copyWith(color: foreignColor)),
              CustomText(text: title ,alignText: TextAlign.center,txtStyle: AppTextStyleTheme.largeTxtBld.copyWith(color: Get.theme.primaryColor.withOpacity(.9))),
              UiHelper.sizedBox4h
            ],
          ),
        ),
      ],
    );
  }
}

