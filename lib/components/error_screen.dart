import 'package:flutter/material.dart';
import 'package:list_users_app/constants/color_helper.dart';
import 'package:list_users_app/generated/l10n.dart';

class ErrorScreen extends StatelessWidget {
  final Function? onTap;

  const ErrorScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeHelper.appBarColor,
        ),
        onPressed: () => onTap != null ? onTap!() : null,
        child: Text(S.of(context).refresh),
      ),
    );
  }
}
