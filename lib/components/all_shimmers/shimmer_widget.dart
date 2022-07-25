import 'package:flutter/material.dart';
import 'package:list_users_app/constants/color_helper.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;

  const ShimmerWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeHelper.shimmerBaseColor,
      highlightColor: ThemeHelper.shimmerHighlightColor,
      child: child!,
    );
  }
}
