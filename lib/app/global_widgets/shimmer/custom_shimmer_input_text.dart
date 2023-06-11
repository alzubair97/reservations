import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomInputTextListShimmer extends StatelessWidget {
  final int itemCount;
  const CustomInputTextListShimmer({Key? key, this.itemCount = 20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.theme.cardColor,
      highlightColor: Get.theme.highlightColor,
      child: ListView.builder(
        itemCount: itemCount,
        padding: EdgeInsets.only(top: 5.h),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: CustomInputShimmer(),
        ),
      ),
    );
  }
}

class CustomInputShimmer extends StatelessWidget {
  const CustomInputShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 7.h,
      color: Colors.white,
    );
  }
}
