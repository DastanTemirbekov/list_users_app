// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screens/splash_screen.dart' as _i1;
import '../screens/user_detail_screen/user_detail_screen.dart' as _i3;
import '../screens/users_screen/users_screen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    UsersScreenRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.UsersScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailScreenRouteArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.UserDetailScreen(key: args.key, username: args.username),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(UsersScreenRoute.name, path: '/users-screen'),
        _i4.RouteConfig(UserDetailScreenRoute.name, path: '/user-detail-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.UsersScreen]
class UsersScreenRoute extends _i4.PageRouteInfo<void> {
  const UsersScreenRoute()
      : super(UsersScreenRoute.name, path: '/users-screen');

  static const String name = 'UsersScreenRoute';
}

/// generated route for
/// [_i3.UserDetailScreen]
class UserDetailScreenRoute
    extends _i4.PageRouteInfo<UserDetailScreenRouteArgs> {
  UserDetailScreenRoute({_i5.Key? key, required String username})
      : super(UserDetailScreenRoute.name,
            path: '/user-detail-screen',
            args: UserDetailScreenRouteArgs(key: key, username: username));

  static const String name = 'UserDetailScreenRoute';
}

class UserDetailScreenRouteArgs {
  const UserDetailScreenRouteArgs({this.key, required this.username});

  final _i5.Key? key;

  final String username;

  @override
  String toString() {
    return 'UserDetailScreenRouteArgs{key: $key, username: $username}';
  }
}
