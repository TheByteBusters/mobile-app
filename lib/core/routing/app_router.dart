import 'package:auto_route/auto_route.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/routing/reservation_navigation_screen.dart';
import 'package:mobile_app/core/routing/search_navigation_screen.dart';
import 'package:mobile_app/features/auth/ui/auth_screen/auth_screen.dart';
import 'package:mobile_app/features/auth/ui/get_started/get_started_screen.dart';
import 'package:mobile_app/features/home/ui/home_screen/home_screen.dart';
import 'package:mobile_app/features/incubators_screen/ui/incubators_screen.dart';
import 'package:mobile_app/features/main_screen/main_screen.dart';
import 'package:mobile_app/features/monitoring/ui/monitoring_screen.dart';
import 'package:mobile_app/features/onboarding/onboarding_screen.dart';
import 'package:mobile_app/features/profile/ui/profile_screen/profile_screen.dart';
import 'package:mobile_app/features/reservation/ui/reservation_details_screen/reservation_details_screen.dart';
import 'package:mobile_app/features/reservation/ui/reservations_screen/reservations_screen.dart';
import 'package:mobile_app/features/reservation/ui/reservation_form_screen.dart';
import 'package:mobile_app/features/search/ui/search_request_screen.dart';
import 'package:mobile_app/features/search/ui/search_screen/search_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final token = AuthCache.getCacheData('token');

  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(
          page: GetStartedRoute.page,
          initial: token == null ? true : false,
        ),
        AutoRoute(
          page: AuthRoute.page,
          initial: token == '' ? true : false,
        ),
        AutoRoute(
          page: MainRoute.page,
          initial: token != null && token != '' ? true : false,
          children: [
            // parent
            AutoRoute(page: HomeRoute.page),
            AutoRoute(
              page: SearchNavigationRoute.page,
              children: [
                AutoRoute(page: SearchRequestRoute.page),
                AutoRoute(page: SearchRoute.page),
                AutoRoute(page: ReservationFormRoute.page),
              ],
            ),
            // staff
            AutoRoute(page: ReservationNavigationRoute.page, children: [
              AutoRoute(page: ReservationRoute.page, initial: true),
              AutoRoute(page: ReservationDetailsRoute.page),
            ]),
            AutoRoute(page: IncubatorsRoute.page),
            // common
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: MonitoringRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: IncubatorsRoute.page),
      ];
}
