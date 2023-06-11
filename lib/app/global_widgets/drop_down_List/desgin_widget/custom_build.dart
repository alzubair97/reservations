import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/data/enum/spinner_state.dart';
import 'package:reservations/app/data/url_path.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/net_work_image.dart';
import 'package:reservations/app/global_widgets/no_data.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:sizer/sizer.dart';

class CustomSpinnerBuild extends StatelessWidget {
  final Function() getDataFromApi;
  final Rx<SpinnerState> spinnerState;
  final RxBool? isRunTime;
  final Rx<List<dynamic>> items;
  final String title;
  final bool isCountryList;
  final Function(dynamic change) onChangedSelected;

  const CustomSpinnerBuild({
    Key? key,
    required this.items,
    required this.title,
    required this.onChangedSelected,
    required this.getDataFromApi,
    this.isRunTime,
    required this.spinnerState,
    required this.isCountryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SpinnerState.empty != spinnerState.value
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20,right: 8,left: 8),
              child: SearchableList<dynamic>(
                  initialList: items.value,
                  filter: _filterUserList,
                  emptyWidget: const Expanded(
                      child: NoData(
                    // withTopSpeace: false,
                  )),
                  inputDecoration: InputDecoration(
                    labelText: '${TranslateText.searchFor.tr}\t${title.tr}',
                    labelStyle: Get.theme.inputDecorationTheme.hintStyle,fillColor:Get.theme.backgroundColor.withOpacity(.4) ,
                      enabledBorder:   OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: .5),
                      )
                  ),
                  builder: (dynamic actor) => InkWell(
                        onTap: () {
                          onChangedSelected(actor);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Get.theme.backgroundColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0,),
                                child: !isCountryList
                                    ? Icon(items.value[0] != actor
                                        ? Icons.radio_button_off_outlined
                                        : Icons.radio_button_checked_outlined)
                                    : CustomExtendedImage(
                                        clipRRectBorder: 3.sp,
                                        imageUrl:
                                            "${AppUrl.countriesFlagsUrl}${actor.twoLetterIsoCode}",
                                        imageWidth: 25.sp,
                                        imageHeight: 25.sp,
                                      ),
                              ),
                              Expanded(
                                child: CustomText(
                                  text: actor.text.toString(),
                                  // txClr: Get.theme.dividerColor,
                                  alignText: TextAlign.center,
                                  txtStyle: AppTextStyleTheme.madelTxtBld,
                                ),
                              ),
                              if (isCountryList)
                                Visibility(
                                  visible: items.value[0] == actor,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(Icons.check),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )))
          : const Flexible(
              fit: FlexFit.loose,
              child: NoData(
                // withTopSpeace: false,
              )),
    );
  }

  List<dynamic> _filterUserList(search) {
    return items.value
        .where(
          (element) =>
              element.text.toLowerCase().contains(search) ||
              element.text.toUpperCase().contains(search) ||
              element.text.contains(search),
        )
        .toList();
  }
}
