import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/constants/color_helper.dart';
import 'package:list_users_app/constants/text_helper.dart';

class Exceptions {
  static showFlushbar(
    String message, {
    required BuildContext context,
    FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM,
  }) {
    Flushbar(
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(10.r),
      margin: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      flushbarPosition: flushbarPosition,
      flushbarStyle: FlushbarStyle.FLOATING,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: 24.w,
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextHelper.medium14.copyWith(
          color: ThemeHelper.textWhiteColor,
        ),
      ),
      mainButton: IconButton(
        onPressed: () {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    ).show(context);
  }
}
