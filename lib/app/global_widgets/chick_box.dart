import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';

class CustomCheckBox extends StatelessWidget {
  final String checkTxt;
  final RxBool checkVal;
  final double padding;
  final MainAxisAlignment mainAxis;
  const CustomCheckBox(
      {Key? key,
      required this.checkVal,
      required this.checkTxt,
      this.mainAxis = MainAxisAlignment.start,this.padding=25.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          Obx(
            () => Checkbox(
              value: checkVal.value,
              onChanged: (val) {
                checkVal.value = val!;
              },
              activeColor: mainColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          Expanded(
            child: CustomText(
              text: checkTxt,
              txtStyle: AppTextStyleTheme.madelTxtNor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBoxBool extends StatelessWidget {
  final String checkTxt;
  final Color? checkTxtCol;
  final TextStyle? txtStyle;
  final bool checkVal;
  final Function(bool value) checkFun;
  final MainAxisAlignment mainAxis;
  const CustomCheckBoxBool(
      {Key? key,
      required this.checkVal,
      required this.checkTxt,
      this.mainAxis = MainAxisAlignment.start,
      required this.checkFun,
      this.checkTxtCol, this.txtStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 4.h,
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          Checkbox(
            value: checkVal,
            onChanged: (val) {
              checkFun(val!);
            },
            activeColor: mainColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Expanded(
              child: CustomText(textMaxLines: 2,
            text: checkTxt,
                txtStyle:txtStyle?? AppTextStyleTheme.superSmallTxtBld.copyWith(color: checkTxtCol),
          )),
        ],
      ),
    );
  }
}
