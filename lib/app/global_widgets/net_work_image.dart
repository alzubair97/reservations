import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:reservations/app/core/utils/const/image_path.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String imageAsset;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? boxFit;
  final bool noCacheImage;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.imageAsset = AppImages.logo,
    this.imageWidth,
    this.imageHeight,
    this.noCacheImage = false,
    this.boxFit,this.title="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
      4),  //  (imageHeight ?? 10.h) < 10.h ? (imageHeight ?? 10.h) / 4 : 4),
      child: Container(
        width: imageWidth ?? 10.h,
        height: imageHeight ?? 10.h,
        decoration:BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill
          ),
        ),
        child:title.isNotEmpty? Container(margin: EdgeInsets.only(top: 10.5.h),decoration: BoxDecoration(
          gradient: LinearGradient(end:Alignment.centerRight ,
            colors: [Colors.black.withOpacity(.2),Colors.black.withOpacity(.3)],
          ),
        ),child:title.isNotEmpty? CustomText(text:title,txtStyle: AppTextStyleTheme.madelTxtBld.copyWith(color: Colors.white),alignText: TextAlign.center,):SizedBox()):SizedBox(),
      ),
    );
  }
}

class CustomCircleNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String imageAsset;
  final double? imageWidth;
  final double? imageHeight;

  const CustomCircleNetworkImage({
    Key? key,
    required this.imageUrl,
    this.imageAsset = AppImages.logo,
    this.imageWidth,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: imageWidth ?? 10.h,
        height: imageHeight ?? 10.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          cacheKey: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
              child: SpinKitSpinningLines(
            color: Colors.black,
            size: 40.0,
          )),
          errorWidget: (context, url, error) => Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            child: Image.asset(
              imageAsset,
              fit: BoxFit.contain,
              color: Colors.white.withOpacity(0.8),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomExtendedImage extends StatelessWidget {
  final String imageUrl;
  final String imageAsset;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? boxFit;
  final double? clipRRectBorder;

  const CustomExtendedImage({
    Key? key,
    required this.imageUrl,
    this.imageWidth,
    this.boxFit,
    this.imageHeight,
    this.imageAsset = AppImages.logo,
    this.clipRRectBorder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(clipRRectBorder ?? 0),
      child: ExtendedImage.network(
        imageUrl,
        width: imageWidth,
        fit: boxFit ?? BoxFit.contain,
        cache: true,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.loading:
              return Shimmer.fromColors(
                baseColor: Get.theme.highlightColor,
                highlightColor: Get.theme.selectedRowColor,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.contain,
                      color: Colors.white.withOpacity(0.8),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                ),
              );
            case LoadState.failed:
              return SizedBox(
                width: double.infinity,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.contain,
                      ),
                    )),
              );
          }
        },
      ),
    );
  }
}

