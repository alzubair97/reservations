import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/helpers/responsbal_screen_size_helper.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

class IconActionButton extends StatelessWidget {
  final IconData icon;
  final Color? icnColor;
  final double? icnSize;
  final bool inAppBar;
  final Function() onPressed;

  const IconActionButton(
      {Key? key,
      this.icon = Icons.arrow_forward_outlined,
      this.icnColor,
      required this.onPressed,
      this.icnSize=25, this.inAppBar=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ? newSize = ResponsiveSize.isSmallScreen() ? icnSize : icnSize! + 5;

    return IconButton(

        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: icnColor,
          size:inAppBar==false?newSize:newSize!+2,
        ));
  }
}

class IconBgButton extends StatelessWidget {
  final IconData icon;
  final Color? icnColor, bgClr;
  final double size;
  final Function() onPressed;

  const IconBgButton(
      {Key? key,
      this.icon = Icons.search_sharp,
      this.icnColor,
      required this.onPressed,
      this.bgClr,
      this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double newSize = ResponsiveSize.isSmallScreen() ? size : size + 10;
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: newSize,
          height: newSize,
          // padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: bgClr??Colors.grey.shade200),
          child: Icon(icon, color: icnColor??Colors.white, size: newSize - 7),
        ));
  }
}

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final Color? icnColor;
  final String text;
  final bool inAppBar,inHome;
  final double size, textSize;
  final TextStyle ?style;
  final Function() onPressed;

  const IconTextButton(
      {Key? key,
      this.icon = Icons.search_sharp,
      this.icnColor,
      required this.onPressed,
      this.size = 20,
      required this.text,
      this.textSize = 9,this.style,this.inAppBar=false,this.inHome=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextButton.icon(
          //
          //     onPressed: onPressed, icon: icon, label: label)
          CustomText(
            text: text,
            txtStyle:inAppBar==true?AppTextStyleTheme.appParTxtBld.copyWith(color: icnColor):style??AppTextStyleTheme.madelTxtBld.copyWith(color: icnColor),
          ),
          const SizedBox(
            width: 2,
          ),
          Icon(
            icon,
            color: icnColor,
            size: size,
          ),
           SizedBox(
            width:inHome?0:8,
          ),
        ],
      ),
    );
  }
}
class IconSvgButton extends StatelessWidget {
  final String imgPath;
  final double iconSized;
  final Function() onPressed;

  const IconSvgButton(
      {Key? key,
      required this.imgPath ,
      required this.onPressed, this.iconSized=25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double newSize = ResponsiveSize.isSmallScreen() ? iconSized +10 : iconSized + 20;

    return GestureDetector(
      onTap: onPressed,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
        child: SizedBox(
          height: newSize,
          width: newSize,
          child:SvgPicture.asset(imgPath,width: newSize-5,height: newSize-5,//color:context.theme.primaryIconTheme.color,
          )
        ),
      ),
    );
  }
}

class FlotChildrenButton extends StatelessWidget {
  final IconData icon;
  final Color? iconBgColor;
  final String label;

  const FlotChildrenButton(
      {Key? key,
      this.icon = Icons.search_sharp,
      required this.iconBgColor,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 17.w,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
            child: CustomText(
              text: label,
              txSize: 6.sp,
            )),
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
