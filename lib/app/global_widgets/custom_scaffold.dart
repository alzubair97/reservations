import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final PreferredSizeWidget? newAppBar;
  final List<Widget>? actionAppBar;
  final Color? bgColor, appBarClr, titleColor;
  final Function()? fun;
  final bool resizeAvoidBtomInset,isAdd;
  final TabBar? tapBar;
  final AppBar? appBar;
  final Widget? flotButton, leadingBtn;

  const CustomScaffold(
      {Key? key,
      required this.title,
      required this.child,
      this.newAppBar,
      this.actionAppBar,
      this.flotButton,
      this.leadingBtn,
      this.bgColor,
      this.fun,
      this.tapBar,
      this.resizeAvoidBtomInset = true,
      this.appBarClr,
      this.titleColor, this.appBar,this.isAdd=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        fun ?? () => Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        resizeToAvoidBottomInset: resizeAvoidBtomInset,
        appBar:title.isNotEmpty?  newAppBar ??
            AppBar(backgroundColor: context.theme.appBarTheme.backgroundColor,
              elevation: 0,
              title: Text(title.tr, style: AppTextStyleTheme.appParTxtBld,),
              leading: leadingBtn,
              centerTitle: false,
              actions:actionAppBar,
              bottom: tapBar,
              titleSpacing: 0,
            ):null,
        body: SafeArea(child: child),
        floatingActionButton: flotButton,
        floatingActionButtonLocation:isAdd?FloatingActionButtonLocation.endFloat:FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class CustomIconBackBtn extends StatelessWidget {
  const CustomIconBackBtn({Key? key, this.onPressed, this.iconClor})
      : super(key: key);
  final Function()? onPressed;
  final Color? iconClor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed ?? () => Get.back(),
        child: Icon(
          Icons.arrow_back,
          color: iconClor ?? Get.theme.indicatorColor,
        ));
  }
}
