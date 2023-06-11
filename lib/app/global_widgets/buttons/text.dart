import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';

class TextActionButton extends StatelessWidget {
  final String txt;
  final Color? textColor;
  final Function() onPressed;

  const TextActionButton(
      {Key? key, required this.txt, this.textColor, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(txt.tr,
            textAlign: TextAlign.start,
            style: AppTextStyleTheme.smallTxtNor.copyWith(color: textColor)));
  }
}