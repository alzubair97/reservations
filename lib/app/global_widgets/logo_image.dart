import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/color.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Theme.of(context).backgroundColor == LightColor.background
          ? "assets/img/logo.png"
          : "assets/img/whiteLogo.png",
      // width: 20.w,
    );
  }
}
