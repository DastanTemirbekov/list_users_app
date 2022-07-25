import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final double height;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height = 60,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.black,
          width: 1.w,
        ),
      ),
      width: height.h,
      height: height.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 40.h,
          ),
        ),
      ),
    );
  }
}
