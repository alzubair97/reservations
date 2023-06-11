import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';

class CustomButtonInputText extends StatelessWidget {
  const CustomButtonInputText({
    Key? key,
    required this.textEditingController,
    required this.fun,
    this.textHint = "",
    this.suffixTxt = "   ",
    this.icon,
    this.icon2,
    this.paddingV = 8 - 0,
    this.isRequired = false,
    this.isEnabled = true,
    this.validatorError, this.paddingh=32,this.withBolder=true,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String textHint, suffixTxt;
  final double? paddingV;
  final double paddingh;
  final bool? isRequired;
  final bool isEnabled;
  final bool withBolder;
  final IconData? icon, icon2;
  final Function() fun;
  final FormFieldValidator<String>? validatorError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: paddingV!,horizontal: paddingh),
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:withBolder? Colors.grey.shade400:Colors.transparent, width: 1)
            ),
            fillColor:withBolder? !isEnabled ? Get.theme.selectedRowColor : null: Get.theme.backgroundColor,
            enabled: isEnabled,
            hintText: textHint.tr,
            labelText: withBolder?textHint.tr:null,
            hintStyle: AppTextStyleTheme.superSmallTxtNor.copyWith(color: allIcon),
            labelStyle: AppTextStyleTheme.inputText,
            prefixText: "  ",
            suffixText: suffixTxt.tr,
            suffixIcon:
                Icon(Icons.keyboard_arrow_down, color: Get.theme.primaryColor),
            prefixIcon: icon != null
                ? Icon(icon, color: Get.theme.primaryColor)
                : null,
          ),
          style: AppTextStyleTheme.inputText,
          textInputAction: TextInputAction.next,
          controller: textEditingController,
          validator: isRequired!
              ? (x) => x!.isEmpty
                  ? '$textHint ${TranslateText.required.tr}'
                  : validatorError != null
                      ? validatorError!(x)
                      : null
              : null,
        ),
      ),
    );
  }

  Container customIcon(IconData iconData) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.teal.shade300,
        borderRadius: BorderRadiusDirectional.circular(5),
      ),
      child: Icon(
        iconData,
        color: Get.theme.dividerColor,
        size: 25,
      ),
    );
  }
}
