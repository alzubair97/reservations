import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/global_widgets/text/input_text.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/view/auth/forget_password/forget_password_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/buttons/custom.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
   ForgetPasswordView({Key? key}) : super(key: key);
  final _controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _controller.globalKey,
                child: Column(
                  children: [
                    UiHelper.sizedBox24h,
                    CustomText(text:TranslateText.pleaseEnterTheConfirmationCodeThatWasSentYou,txtStyle: AppTextStyleTheme.madelTxtNor),
                   UiHelper.sizedBox4h,
                    Directionality(textDirection: TextDirection.ltr,
                      child: OtpTextField(
                        numberOfFields: 6,
                        autoFocus: true,
                        // obscureText: true,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        onSubmit: (String verificationCode){
                          print(verificationCode.toString());
                        },
                      ),
                    ),
                    GetBuilder<ForgetPasswordController>(builder: (show) {
                      return CustomTextInput(
                        textEditingController: _controller.password,
                        obscureTxt: show.showPass.value,
                        labelText: TranslateText.password,
                        isRequired: true,
                        validatorError: (x) =>
                            _controller.validatePassword(x.toString()),
                        icon2: IconButton(
                          onPressed: () => _controller.showPassFun(),
                          icon: Icon(show.showPass.value
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined),
                        ),
                      );
                    }),
                    Obx(() => CustomTextInput(
                        textEditingController:
                        _controller.confirmPassword,
                        labelText: TranslateText.confirmPassword,
                        obscureTxt: _controller.showPass.value,
                        isRequired: true,
                        validatorError: (x) =>
                            _controller.validateConfirmPassword(
                                _controller.password, x.toString()))),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(width: double.infinity,
                        child: ActionButtonWthNoPrg(
                            text: TranslateText.confirmation,
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
  }
}
