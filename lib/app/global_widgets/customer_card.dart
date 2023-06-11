
import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/helpers/responsbal_screen_size_helper.dart';
import 'package:reservations/app/core/utils/helpers/ui_helpers.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCard extends StatelessWidget {
  final String contactName;
  final String date;
  final String mobile;
  final String name;
  final String requirment;
  Widget chaild;
  Widget ?child2;
  String? followType;
  MyCard(
      {Key? key,
      this.contactName = "",
      this.date = "",
      required this.mobile,
      required this.name,
      this.requirment = "",
      this.followType = "",
      this.child2,
      required this.chaild})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 0),elevation: 0,
      shape: const RoundedRectangleBorder(side:BorderSide(width: .25,color:Color(0xFFBDBDBD))),
      // shape:  RoundedRectangleBorder(side:BorderSide(width: 1,color:Color(0xFFBDBDBD)) ),
      // decoration: BoxDecoration(
      //   color: whiteColor,
      //   borderRadius: const BorderRadiusDirectional.all(Radius.circular(4)),
      // ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 8.0, end: 4, top: 4.0, bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: name.toString(),
                  txtStyle: AppTextStyleTheme.smallTxtBld,
                ),
                chaild,
              ],
            ),
            SizedBox(height: 4,),
            // UiHelper.sizedBox1h,

            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.whatshot,size: ResponsiveSize.isSmallScreen() ? 17 : 30,)),
               UiHelper.sizedBox2w,
                InkWell(
                    onTap: () => _callLauncher("tel:$mobile"),
                    child: CustomText(
                      text: mobile.toString(),
                      txtStyle: AppTextStyleTheme.smallTxtNor,
                    )),
                UiHelper.sizedBox2w,
                InkWell(
                    onTap: () => _callLauncher("tel:$mobile"),
                    child: Icon(
                      Icons.phone,
                      size: ResponsiveSize.isSmallScreen() ? 17 : 30,
                    )),
                Expanded(child: SizedBox()),

                child2??const SizedBox()

              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " لا يمكن الوصول الى$url";
    }
  }

}
