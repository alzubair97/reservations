import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/style/color.dart';
import 'package:sizer/sizer.dart';

class SearchWidget {
  Widget search(
      {BuildContext? context, onChanga, textFildController, String? title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2,right: 0,left: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FocusScope(
                child: Focus(
                    child: TextField(
                      controller: textFildController,
                      onChanged: onChanga,
                      style: AppTextStyleTheme.madelTxtBld,
                      readOnly: false,

                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        hintText: title!.tr,
                        hintStyle:AppTextStyleTheme.madelTxtBld.copyWith(color: allIcon),
                        contentPadding:
                        EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide( color: Colors.transparent, width: .5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide( color: Colors.grey.shade200, width: 1),
                        ),
                        prefixIcon: SizedBox(
                          width: 10.0,
                          child: Icon(
                            Icons.search,
                            color: allIcon,
                          ),
                        ),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }

  Padding buildTitle(BuildContext context, String titleText) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
      child: Row(
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
              child: Divider(
                height: 1.0,
                color: mainColor,
              ))
        ],
      ),
    );
  }

  ListTile buildListTileDrawer(String title, var icon, var onTap) {
    return ListTile(
      title: Text(
        title,
      ),
      leading: Icon(
        icon,
      ),
      onTap: onTap,
    );
  }
}