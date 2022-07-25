import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/constants/color_helper.dart';

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: CupertinoActivityIndicator(
        radius: 15.r,
        color: ThemeHelper.textWhiteColor,
      ),
    );
  }
}
