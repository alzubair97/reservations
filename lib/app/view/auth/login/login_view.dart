import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/core/utils/helpers/validate_text_helper.dart';
import 'package:reservations/app/global_widgets/cloese_app.dart';
import 'package:reservations/app/global_widgets/line_widget.dart';
import 'package:reservations/app/view/auth/login/login_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/buttons/custom.dart';
import 'package:reservations/app/global_widgets/logo_image.dart';
import 'package:reservations/app/global_widgets/text/input_text.dart';
import 'package:reservations/app/global_widgets/text/password_input_text.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(decoration:  BoxDecoration(color: context.theme.cardColor,
        image: const DecorationImage(
            image: AssetImage("assets/img/logo.png"), opacity:.05 ,fit: BoxFit.contain,)
    ),
        child: Scaffold(backgroundColor:Colors.transparent,
          body: ListView(
            shrinkWrap: true,
            children: [
              UiHelper.sizedBox2h,
              UiHelper.sizedBox8h,
              SizedBox(height: 30.h, child: const LogoImage()),
              UiHelper.sizedBox4h,
              UiHelper.sizedBox2h,
              SizedBox(height: 48.h,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: buildLogin(_controller, context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0),
                      child: Wrap(alignment: WrapAlignment.center,
                        children: [
                          UiHelper.sizedBox1w,
                          CustomText(text: "Site",
                              txtStyle: AppTextStyleTheme.madelTxtNor
                                  .copyWith(
                                  color: context.theme.primaryColor)),
                          UiHelper.sizedBox1w,
                          CustomText(text: "About Us",
                              txtStyle: AppTextStyleTheme.madelTxtNor
                                  .copyWith(
                                  color: context.theme.primaryColor)),
                          UiHelper.sizedBox1w,
                          CustomText(text: "COPYRIGHT AAMAL TECH ADVANCE",
                              txtStyle: AppTextStyleTheme.madelTxtNor),
                          UiHelper.sizedBox1h,
                          CustomText(text: "Create With BY Aamal Tech",
                              txtStyle: AppTextStyleTheme.madelTxtNor),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Padding buildLogin(LoginController loginControl, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(key: loginControl.loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color:  Get.theme.backgroundColor ,
                  borderRadius: const BorderRadiusDirectional
                      .only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(5),
                  ),),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: CustomText(text: TranslateText.login,
                    txtStyle: AppTextStyleTheme
                        .madelTxtBld.copyWith(color: context.theme.primaryColor.withOpacity(1)))),
            CustomTextInput(
              withBolder: false,
              textEditingController: loginControl.phoneNumber,
              icon1: Icons.phone,
              labelText: TranslateText.phoneNumber,
              isRequired: true,
              paddingVertical: 0,
              paddingHorizontal: 0,
                keyboardType: TextInputType.number,
                validatorError: (x) => TextValidate().validateMobileNumber(x.toString())
            ),
            const SizedBox(height: 1,),
            PasswordInputText(
              textEditingController:
              loginControl.password,
            ),

            ActionButton(
                isLoading: loginControl.isLoginLoading,
                text: TranslateText.login,
                onPressed: () => loginControl.login()),
            UiHelper.sizedBox2h,
            InkWell(onTap: PhoneNumber(context).onWillPop,
              child: Center(
                child: Column(
                  children: [
                    CustomText(
                        text: TranslateText.forgetPassword.tr,
                        txtStyle: AppTextStyleTheme.madelTxtBld),
                    const Line(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
