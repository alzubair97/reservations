import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/core/utils/masks.dart';
import 'package:reservations/app/global_widgets/center_progres/center_progress.dart';
import 'package:reservations/app/global_widgets/change_language.dart';
import 'package:reservations/app/global_widgets/net_work_image.dart';
import 'package:reservations/app/global_widgets/no_data.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/global_widgets/try_again.dart';
import 'package:reservations/app/view/auth/profile/profile/profile_controller.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileControl = Get.put(ProfileController());

    return profileControl.obx((userProfile) =>
            Container(color: context.theme.backgroundColor,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 2),
                children: [
                  Container(color: context.theme.cardColor ,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2)),
                          child: CustomNetworkImage(
                            imageUrl: AppMasks.profile.imageUrl??"https://www.facebook.com/photo?fbid=1841495866234431&set=a.105785079805527",
                            boxFit: BoxFit.cover,
                          ),

                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppMasks.profile.userName?? '',
                                  style:AppTextStyleTheme.largeTxtBld),
                              Text(AppMasks.profile.email?? '...',
                                  style: AppTextStyleTheme.madelTxtBld
                                      .copyWith(color: context.theme.primaryColor)),
                            ],
                          ),
                        ),
                        UiHelper.sizedBox8w
                      ],
                    ),
                  ),

                  _buildSectionTitle(
                    icon: Icons.account_circle_outlined,
                    title: TranslateText.account,
                  ),
                  Wrap(
                    children: [
                      _buildTile(
                        title: TranslateText.changePassword,
                        onTap: () {},
                        // onTap: () => Get.toNamed(Routes.changePassword),
                        subTitle: TranslateText.pressHereToChangePassword,
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      _buildTile(
                        title: TranslateText.notifications,
                        onTap: () {},
                        subTitle:
                        '${TranslateText.pressHereToShowAll.tr} ${TranslateText.notifications.tr}',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                  _buildSectionTitle(
                    icon: Icons.language_outlined,
                    title: TranslateText.language,
                  ),
                  _buildTile(
                    title: AppMasks.appLanguge.firstWhere((element) => Get.locale!.languageCode
                        .contains(element.langugeCode ?? '')).langugeName ??
                        '',
                    onTap: () => CustomChangeLanguage().showLanguage(),
                    subTitle: TranslateText.pressToChangLanguge,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  _buildTile(
                    title: TranslateText.changTheme,
                    onTap: () => profileControl.changeTheme(),
                    subTitle: TranslateText.pressToChangTheme,
                    trailing: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: Icon(
                          Get.theme.cardColor == Colors.white
                              ? Icons.sunny
                              : Icons.sunny,
                          color: Get.theme.cardColor == Colors.white
                              ? Colors.black.withOpacity(0.8)
                              : Colors.yellow,
                        )),
                  ),
                  _buildTile(
                    title: TranslateText.aboutApp,
                    onTap: () {},
                    subTitle: TranslateText.pressToShowAboutApp,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  _buildTile(
                    onTap: () => profileControl.deleteAccountFun(),
                    title: TranslateText.deleteAccount,
                    subTitle: TranslateText.pressToDeleteAccount,
                    trailing: Icon(
                      Icons.no_accounts,
                      size: 18.sp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  _buildTile(
                    onTap: () => profileControl.exitAccountFun(),
                    title: TranslateText.exitAccount,
                    subTitle: TranslateText.pressToExitAccount,
                    trailing: Icon(
                      Icons.sensor_door_outlined,
                      size: 18.sp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
        onLoading: const Center(child: CenterProgress()),
        onEmpty: const NoDataFoundSpinner(),
        onError: (v) =>
            TryAgainSpinner(tryFun: () => profileControl.getUserProfileFun()),
      );
  }

  Widget _buildTile(
      {String? title,
      String? subTitle,
      Widget? trailing,
      required Function() onTap,
      bool isEnable = true}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.cardColor,
            borderRadius: BorderRadius.circular(5.sp)),
        margin: EdgeInsets.all(5.sp),
        child: isEnable
            ? ListTile(
                dense: true,
                title: Text(
                  (title ?? '').tr,
                  style: AppTextStyleTheme.smallTxtBld,
                ),
                subtitle: Text(
                  (subTitle ?? '').tr,
                  style: Get.textTheme.caption!.copyWith(color: Colors.grey),
                ),
                trailing: trailing,
              )
            : const SizedBox(),
      ),
    );
  }

  Widget _buildSectionTitle({required IconData icon, String? title}) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            const SizedBox(width: 4),
            Icon(icon),
            const SizedBox(width: 4),
            CustomTitleText(text: title ?? ''),
          ],
        ));
  }
}
