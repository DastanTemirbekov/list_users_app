import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/components/all_shimmers/shimmer_widget.dart';
import 'package:list_users_app/constants/color_helper.dart';

class UserCardShimmer extends StatelessWidget {
  final int? itemCount;

  const UserCardShimmer({
    Key? key,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 20.h,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: ThemeHelper.textBlackColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            height: 100.h,
          );
        },
      ),
    );
  }
}
