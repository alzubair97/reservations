import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';
import 'package:reservations/style/color.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Function() onPressed;
  final RxBool isLoading;

  const ActionButton(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.textColor,
      required this.onPressed,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: isLoading.value,
        child: Container( width: 100.w,decoration:
        BoxDecoration(
          color:Get.theme.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )
        ),
          child: InkWell(
            onTap:onPressed,
            child: !isLoading.value
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: CustomText(
                          text: text.tr, txtStyle: AppTextStyleTheme.textButton),
                    ))
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 30.w,
                      child: SpinKitSpinningLines(color: Colors.white, size: 24.sp)),
                ),
          ),
        ),
      ),
    );
  }
}

class ActionButtonWthNoPrg extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Widget? newChild;
  final double borderSize;

  const ActionButtonWthNoPrg(
      {Key? key,
      this.text = '',
      required this.onPressed,
      this.newChild,
      this.borderSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderSize));
        })),
        child: newChild ??
            CustomText(
                text: text.tr, txtStyle: AppTextStyleTheme.textButton));
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Widget? newChild;

  const CustomOutlinedButton(
      {Key? key, this.text = '', required this.onPressed, this.newChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: newChild ??
              CustomText(
                  text: text.tr,
                  txtStyle: AppTextStyleTheme.textButton
                      .copyWith(color: foreignColor))),
    );
  }
}
