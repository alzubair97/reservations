import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
      this.textEditingController,
      this.labelText = "",
      this.exText = "",
      this.maxLgh,
      this.maxLin = 1,
      this.obscureTxt = false,
      this.onChangeText,
      this.icon1,
      this.icon2,
      this.isRequired = false,
      this.withMaxLgh = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.validatorError,
      this.inetValue,
      this.filled = true,
      this.isEnabled = true,this.paddingHorizontal=32, this.paddingVertical=8,this.withBolder=true, this.stringLgh=50})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final String exText;
  final int maxLin;
  final double paddingHorizontal;
  final String? inetValue;
  final int? maxLgh;
  final int? stringLgh;
  final double paddingVertical;
  final bool obscureTxt, isRequired, isEnabled,withMaxLgh, filled,withBolder;
  final IconData? icon1;
  final Widget? icon2;
  final ValueChanged<String>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:paddingVertical,horizontal: paddingHorizontal),
        child: TextFormField(
          cursorColor: mainColor,
          initialValue: inetValue,
          decoration: InputDecoration(
            labelStyle:Get.textTheme.headline5!.copyWith(color: Get.theme.hintColor) ,
            hintStyle:Get.textTheme.headline3!.copyWith(color: Get.theme.hintColor.withOpacity(.3)) ,
            fillColor:withBolder? !isEnabled ? Get.theme.selectedRowColor : null:Get.theme.backgroundColor,
            filled: filled,
            isCollapsed: false,
            labelText:withBolder?labelText.tr:null ,
            hintText:withBolder?exText.isNotEmpty?"${TranslateText.example.tr}\t$exText":"":labelText.tr,
            suffixText: '   ',
            prefixIconColor:Get.theme.primaryColor ,
            suffixIconColor: Get.theme.indicatorColor,
            prefixIcon: icon1 != null
                ? Icon(icon1,
              color:foreignColor.withOpacity(.8) ,
            ) : null,
            suffixIcon: icon2,
           focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: mainColor, width: 0.5),
          ) ,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(width:1.5,color: context.theme.primaryColor.withOpacity(.7)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide:  BorderSide( color:withBolder?Colors.black:Colors.transparent, width: 1),
            ),
          ),
          onChanged: onChangeText,
          style: AppTextStyleTheme.inputText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureTxt,
          enabled: isEnabled,
          controller: textEditingController,
          maxLines: maxLin,
          maxLength:maxLgh,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:(x) {
            if(isRequired&& x!.trim().isEmpty) {
              return '${labelText.tr} ${TranslateText.required.tr}';
            } else if(withMaxLgh&& x!.length>stringLgh!) {
              return "لقد تجاوزت القبمة المدخلة اكثر من 50 حرفا";
            }else if( validatorError != null){
              return validatorError!(x);
            }
            return null;
        },
        ),
      ),
    );
  }
}
