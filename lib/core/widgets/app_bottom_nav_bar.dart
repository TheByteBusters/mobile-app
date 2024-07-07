import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobile_app/core/cache/auth_cache.dart';
// import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/providers/navigation_provider.dart';
import 'package:mobile_app/core/theming/colors.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationProvider);
    final indexNotifier = ref.watch(navigationProvider.notifier);
    // final role = AuthCache.getCacheData('role');

    // final routesList = [
    //   role == 'parent' ? Routes.homeScreen : Routes.incubatorsScreen,
    //   role == 'parent' ? Routes.monitoringScreen : Routes.reservationScreen,
    //   Routes.profileScreen,
    // ];

    return BottomNavigationBar(
      fixedColor: ColorsManager.mainGreen,
      currentIndex: index,
      onTap: (value) {
        indexNotifier.setIndex(value);
        if (index == value) return;
        // context.pushNamed(routesList[value]);
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
    );
  }
}
