import 'package:auto_route/auto_route.dart';
import 'package:list_users_app/screens/splash_screen.dart';
import 'package:list_users_app/screens/user_detail_screen/user_detail_screen.dart';
import 'package:list_users_app/screens/users_screen/users_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: SplashScreen,
    ),
    CustomRoute(
      page: UsersScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 200,
    ),
    CustomRoute(
      page: UserDetailScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppRouter {}
