import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/global_widgets/buttons/icon.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';

class GetCustomBottomSheet {
  static show({required Widget child, String? title,bool ?withSave,Function ?save}) {
    Get.bottomSheet(
        Container(color: Get.theme.backgroundColor,
          constraints: BoxConstraints(maxHeight: Get.height - 64),
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                titleBtmSheet(text: title??TranslateText.actions.tr,withSave:withSave,saveFun: save ),
                child,
              ],
            ),
          ),
        ),
        backgroundColor: Get.theme.bottomSheetTheme.backgroundColor,
        isScrollControlled: true);
  }

  static showBottoms({required List<Widget> children}) {
    Get.bottomSheet(
        Container(
          constraints: BoxConstraints(maxHeight: Get.height - 64),
          padding: const EdgeInsets.only(bottom: 8.0),
          color: Colors.transparent,
          width: double.infinity,
          child: Wrap(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.theme.bottomSheetTheme.backgroundColor,
                  ),
                  alignment: Alignment.center,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: children.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 0,
                          thickness: 0,
                          color: Colors.grey,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) =>
                      children[index])),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.theme.cardColor,
                    ),
                    child: Text(TranslateText.close.tr,
                        style: AppTextStyleTheme.madelTxtBld
                            .copyWith(color: Colors.blue))),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        isScrollControlled: true);
  }

  static titleBtmSheet({required String text,bool ?withSave,Function?saveFun}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Visibility(
                  visible: text.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: CustomTitleText(
                      text: text,alignText:TextAlign.start,
                    ),
                  ),
                ),
              ),
              Visibility(visible: withSave==true,
                child: InkWell(onTap: (){
                  saveFun!();
                },
                  child: Row(
                    children: [
                      IconActionButton(onPressed: (){
                        saveFun!();
                      },
                          icon: Icons.save,
                          icnColor:Get.theme.primaryColor),
                      CustomText(text: TranslateText.save.tr,txtStyle: AppTextStyleTheme.appParTxtBld.copyWith(color: mainColor)),

                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close,
                      color: Get.textTheme.headline5?.backgroundColor))
            ],
          ),
          Divider(height: 0),

        ],
      ),
    );
  }
}