import 'package:reservations/app/core/utils/helpers/helper_ui_app_size.dart';
import 'package:reservations/app/data/enum/spinner_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/data/inter_net_checker.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/buttons/botton_input_text.dart';
import 'package:reservations/app/global_widgets/drop_down_List/desgin_widget/custom_build.dart';
import 'package:reservations/app/global_widgets/no_data.dart';
import 'package:reservations/app/global_widgets/no_wifi_connection_found.dart';
import 'package:reservations/app/global_widgets/shimmer/custom_shimmer_input_text.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/global_widgets/try_again.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomSpinner extends StatelessWidget {
  final Rx<List<dynamic>> items;
  final String title;
  final TextEditingController selectedText;
  final Function() getDataFromApi;
  final Rx<SpinnerState> spinnerState;
  final bool isRequired;
  final bool isEnabled;
  final bool withBolder;
  final double paddingHorizontal;
  final double paddingV;
 final IconData ?icon;
  final bool isCountryList;
  final Function(dynamic change)? onChanged;
  const CustomSpinner(
      {Key? key,
        required this.items,
        required this.title,
        this.isRequired = false,
        this.isEnabled = true,
        required this.selectedText,
        this.onChanged,
        required this.getDataFromApi,
        required this.spinnerState,
        this.isCountryList = false,this.paddingHorizontal=30,this.withBolder=true,this.icon,this.paddingV=8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => spinnerState.value == SpinnerState.loading &&
              items.value.isEmpty
              ? Container(
            color: Get.theme.inputDecorationTheme.fillColor,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal:paddingHorizontal, ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Shimmer.fromColors(
              baseColor: Get.theme.dividerColor.withOpacity(0.5),
              highlightColor: Get.theme.selectedRowColor,
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                      text: "${TranslateText.fetchingData.tr}\t${title.tr}")),
            ),
          )
              : IgnorePointer(
            ignoring: !isEnabled,
            child: CustomButtonInputText(
              // suffixTxt: title,
              icon:icon ,
              withBolder: withBolder,
              isEnabled: isEnabled,
              textEditingController: selectedText,
              icon2: Icons.menu_open_outlined,
              textHint: title.tr,
              paddingh: paddingHorizontal,paddingV: paddingV,
              isRequired: isRequired,
              fun: () {
                Get.bottomSheet(
                    Container(
                        height: UiHelperSize.height2Third,
                        margin: EdgeInsets.only(top: 32.sp),
                        decoration: BoxDecoration(
                            color: Get.theme.cardColor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Obx(
                              () => spinnerState.value ==
                              SpinnerState.loading &&
                              items.value.isEmpty
                              ? const CustomInputTextListShimmer()
                              : Get.find<CheckInterNet>()
                              .interNet
                              .value &&
                              spinnerState.value ==
                                  SpinnerState.error
                              ? TryAgainSpinner(
                              tryFun: getDataFromApi)
                              : !Get.find<CheckInterNet>()
                              .interNet
                              .value &&
                              spinnerState.value ==
                                  SpinnerState.error
                              ? const NoInterNetConnection()
                              : spinnerState.value ==
                              SpinnerState.empty
                              ? const NoData(
                                // withTopSpeace: false
                              )
                              : CustomSpinnerBuild(
                            items: items,
                            title: title,
                            getDataFromApi:
                            getDataFromApi,
                            spinnerState:
                            spinnerState,
                            isCountryList:
                            isCountryList,
                            onChangedSelected:
                                (change) {
                              selectedText.text =
                                  change.text;
                              items.value.remove(change);
                              items.value.insert(0, change);
                              Get.back();
                              if (onChanged != null) {
                                onChanged!(change);
                              }
                            },
                          ),
                        )),
                    isScrollControlled: true);
              },
            ),
          ),
    );
  }
}