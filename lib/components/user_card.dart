import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/components/custom_cached_network_image.dart';
import 'package:list_users_app/constants/text_helper.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String login;
  final Function? onTap;

  const UserCard({
    Key? key,
    required this.imageUrl,
    required this.login,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          top: 10.h,
          right: 15.w,
          left: 10.w,
          bottom: 10.h,
        ),
        primary: Colors.white,
        onPrimary: Colors.grey[400],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.w,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ).copyWith(
        elevation: MaterialStateProperty.all(0.0),
      ),
      onPressed: () => onTap != null ? onTap!() : null,
      child: Row(
        children: [
          CustomCachedNetworkImage(imageUrl: imageUrl),
          const Spacer(flex: 2),
          Text(
            login,
            style: TextHelper.bold20.copyWith(
              color: Colors.black,
            ),
          ),
          const Spacer(flex: 3),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
