import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/components/all_shimmers/shimmer_widget.dart';
import 'package:list_users_app/components/custom_cached_network_image.dart';

class UserDetailShimmer extends StatelessWidget {
  const UserDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            const CustomCachedNetworkImage(
              imageUrl: '',
              height: 100,
            ),
            SizedBox(height: 20.h),
            Container(
              height: 20.h,
              width: 100.w,
              color: Colors.white,
            ),
            SizedBox(height: 10.h),
            Container(
              color: Colors.brown[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Container(
                    width: 0.9.sw,
                    height: 0.35.sh,
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
