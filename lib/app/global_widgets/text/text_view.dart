import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
        required this.text,
        this.txtStyle,
        this.alignText = TextAlign.start,
        this.txClr,
        this.txSize = 10,
        this.txtFontWeight,
        this.textMaxLines,
        this.textDecoration,
        this.directionText})
      : super(key: key);
  final String text;
  final TextAlign alignText;
  final double txSize;
  final int? textMaxLines;
  final Color? txClr;
  final TextDirection? directionText;
  final TextStyle? txtStyle;
  final FontWeight? txtFontWeight;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: alignText,
      maxLines: textMaxLines,
      overflow:
      textMaxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
      style: txtStyle ??
          AppTextStyleTheme.madelTextView.copyWith(
              color: txClr ?? Get.theme.dividerColor,
              fontSize: txSize,
              decoration: textDecoration,
              decorationColor: Get.theme.dividerColor,
              fontWeight: txtFontWeight),
      textDirection: directionText,
    );
  }
}

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    Key? key,
    required this.text,
    this.txClr,
    this.alignText = TextAlign.center,
  }) : super(key: key);
  final String text;
  final Color? txClr;
  final TextAlign alignText;

  @override
  Widget build(BuildContext context) {
    return Text(text.tr,
        textAlign: alignText,
        style: AppTextStyleTheme.largeTxtBld.copyWith(color: txClr));
  }
}