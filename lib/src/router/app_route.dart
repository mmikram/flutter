import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
//@Singleton()
class AppRouter extends $AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, keepHistory: false),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginRoute.page, keepHistory: false),
        AutoRoute(page: MPinRoute.page, keepHistory: false),
      ];
}
