import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:reservations/app/UI/homePage/view_home.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/global_widgets/bottom_bar_curved_componet.dart';
import 'package:reservations/app/global_widgets/buttons/icon.dart';
import 'package:reservations/app/global_widgets/change_language.dart';
import 'package:reservations/app/global_widgets/cloese_app.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/app/home_page_controller.dart';
import 'package:reservations/app/view/auth/profile/profile/profile_view.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/style/color.dart';

final _controller = Get.put(HomePageController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: CloseApp(context).onWillPop, child: buildMainBody(context));
  }

  buildMainBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar:
      AppBar(
        elevation: 0,
        title:
        Text("حجوزاتي",
            style: Theme
                .of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold,color: foreignColor)
          // style:  Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle:true ,
        actions: [
          const IconButton(
            icon: Icon(
              MaterialCommunityIcons.theme_light_dark,
            ),
            onPressed: ThemeService.switchTheme,
          ),
          IconButton(
              icon: const Icon(Icons.language,
              ),
              onPressed: () => CustomChangeLanguage().showLanguage()
          ),
        ],
        titleSpacing: 0,
      ),
      bottomNavigationBar: const BottomBarCurvedComponent(),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller.pageController,
          children:  [
            Home(),
            Container(color: context.theme.backgroundColor),
            const Profile()
          ]),
    );
  }
}


class RowWithIconArrow extends StatelessWidget {
  // final Function() fun;
  final RxBool isShow;
  final String title;

  const RowWithIconArrow({
    Key? key, required this.isShow, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(onTap: (){
        isShow.toggle();
      },
        child: Row(
          children: [
            CustomText(text: title,
                txtStyle: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)
            ),
            UiHelper.sizedBox2w,
            const Spacer(),
            // const Expanded(child: Divider()),
            Obx(() {
              return IconTextButton(onPressed: () {
                isShow.value = !isShow.value;
              }, inHome: true,
                  text: "",
                  icon: isShow.value ? Icons.expand_more_rounded : Icons.expand_less_rounded);
            }),
          ],
        ),
      ),
    );
  }
}



