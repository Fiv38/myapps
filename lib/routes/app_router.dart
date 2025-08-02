import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: HomeRoute.page,
      path: '/home',
      guards: [AuthGuard()],
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: CustomerRoute.page,
      path: '/customer',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: CashFlowRoute.page,
      path: '/cashflow',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: ReportRoute.page,
      path: '/reports',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: OngoingRoute.page,
      path: '/ongoing',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: PosRoute.page,
      path: '/pos',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: LoginRoute.page,
      path: '/login',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: RegisterRoute.page,
      path: '/register',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

    CustomRoute(
      page: ConfigRoute.page,
      path: '/config',
      // guards: [ConfigGuard()],
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),

  ];
}
