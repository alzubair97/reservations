import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:reservations/app/global_widgets/buttons/custom.dart';
import 'package:reservations/app/global_widgets/text/input_text.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/view/auth/login/login_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/custom_raised_button.dart';
import 'package:sizer/sizer.dart';

class CloseApp {
  BuildContext context;
  CloseApp(this.context);

  Future<bool> onWillPop() async {
    Dialogs.materialDialog(
        barrierDismissible: true,
        title: TranslateText.close.tr,
        msg: "هل تريد الخروج من التطبيق",
        dialogShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        msgStyle: Theme.of(context).textTheme.headline6,
        titleStyle: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16.sp,color: foreignColor),
        context: context,
        color: Theme.of(context).colorScheme.background,
        actions: [
          CustomRaisedButton().custom_raised_button(
              btnChild: CustomText(text:
                TranslateText.close.tr,
                txtStyle:Theme.of(context).textTheme.headline1!.copyWith(fontSize: 11.sp, color: Colors.white),
              ),
              onpressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              color: mainColor,
              context: context),
        ]);
    return true;
  }
}
class PhoneNumber {
  BuildContext context;
  PhoneNumber(this.context);
  final _controller = Get.put(LoginController());
  Future<bool> onWillPop() async {
    Dialogs.materialDialog(
        barrierDismissible: true,
        title: "لإعادة تعيين كلمة المرور , يجب إدخال رقم هاتفك المسجل.سنرسل رمز التحقق إلى رقمك.",
        msg: "ادخل رقم هاتفك المسجل",
        dialogShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        msgStyle: Theme.of(context).textTheme.headline6,
        titleStyle: Theme.of(context).textTheme.headline1!,
        context: context,
        color: Theme.of(context).colorScheme.background,
        actions: [
          ListView(shrinkWrap: true,
            children: [
              CustomTextInput(paddingHorizontal: 0,
                paddingVertical: 0,
                withBolder: false,
                textEditingController:
                _controller.phoneNumber,
                icon1: Icons.phone,
                labelText: TranslateText.phoneNumber,
                isRequired: true,
              ),
              ActionButton(
                  isLoading: _controller.isLoginLoading,
                  text: TranslateText.confirmation.tr,
                  onPressed: () {}),
            ],
          ),

        ]);
    return true;
  }
}
