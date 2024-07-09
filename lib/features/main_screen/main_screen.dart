import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final role = AuthCache.getCacheData('role');

    return AutoTabsRouter(
      routes: [
        role == 'parent' ? const HomeRoute() : const IncubatorsRoute(),
        role == 'parent'
            ? const SearchRequestRoute()
            : const ReservationRoute(),
        const ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            title: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/black_green_stork.svg',
                  width: 40.w,
                ),
                horizontalSpace(16),
                Text(
                  'LifeNest',
                  style: TextStyles.h2BlackNormal,
                )
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.vertical(
                top: Radius.circular(16),
              ),
              child: BottomNavigationBar(
                fixedColor: ColorsManager.mainGreen,
                currentIndex: tabsRouter.activeIndex,
                onTap: (value) {
                  tabsRouter.setActiveIndex(value);
                },
                items: [
                  BottomNavigationBarItem(
                    label: role == 'parent' ? 'Home' : 'Incubators',
                    icon: Icon(
                      role == 'parent'
                          ? Icons.home_outlined
                          : Icons.monitor_heart_outlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: role == 'parent' ? 'Search' : 'Requests',
                    icon: Icon(
                      role == 'parent' ? Icons.search : Icons.list_alt_rounded,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(
                      Icons.account_circle_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
