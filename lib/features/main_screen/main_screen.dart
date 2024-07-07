import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/core/theming/colors.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        MonitoringRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: ColorsManager.mainGreen,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Monitoring',
                icon: Icon(
                  Icons.monitor_heart_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'profile',
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
