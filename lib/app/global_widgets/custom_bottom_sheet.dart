import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  customBottomSheets({required Widget customChild, required BuildContext ctx}) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(ctx).colorScheme.secondary,
      ),
      child: customChild,
    ));
  }
}
