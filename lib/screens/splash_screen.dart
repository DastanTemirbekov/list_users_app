import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:list_users_app/helpers/auto_route.gr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  final Tween<double> _tween = Tween(begin: 0.5, end: 1);

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => AutoRouter.of(context).pushAndPopUntil(
        const UsersScreenRoute(),
        predicate: (Route<dynamic> route) => false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 3.0).animate(controller),
          child: ScaleTransition(
            scale: _tween.animate(animation),
            child: Image.asset(
              "assets/images/users_logo.png",
              height: 210,
              width: 210,
            ),
          ),
        ),
      ),
    );
  }
}
