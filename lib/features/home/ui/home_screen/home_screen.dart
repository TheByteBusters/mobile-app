import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/home/ui/home_screen/navigation_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void launchURL(BuildContext context) async {
    final url = Uri.https('egyptiancurebank.com');

    if (await launcher.canLaunchUrl(url)) {
      await launcher.launchUrl(url);
    } else {
      if (!context.mounted) throw 'Could not launch the url';

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('could\'t redirect to egyptiancurebank'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(AuthCache.getCacheData('token'));
    final String role = AuthCache.getCacheData('role');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'Welcome!',
                subtitle: 'We will help you find an incubator',
                withReturn: false,
              ),
              verticalSpace(40.h),
              role == 'parent'
                  ? Center(
                      child: CircleAvatar(
                        radius: 80.w,
                        backgroundColor: ColorsManager.mainGreen,
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(Routes.searchRequestScreen);
                          },
                          child: PhosphorIcon(
                            PhosphorIcons.magnifyingGlass(),
                            size: 100.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : verticalSpace(10.h),
              verticalSpace(70.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    role == 'parent'
                        ? NavigationButton(
                            title: 'Donation',
                            route: '/',
                            icon: PhosphorIcons.handCoins(),
                            tapMethod: () {
                              launchURL(context);
                            },
                          )
                        : NavigationButton(
                            title: 'Requests',
                            route: Routes.reservationScreen,
                            icon: PhosphorIcons.listBullets(),
                          ),
                    verticalSpace(20.h),
                    NavigationButton(
                      title: 'Monitoring',
                      route: role == 'parent'
                          ? Routes.monitoringScreen
                          : Routes.incubatorsScreen,
                      icon: Icons.monitor_heart_outlined,
                    ),
                    verticalSpace(20.h),
                    const NavigationButton(
                      title: 'Profile',
                      route: Routes.profileScreen,
                      icon: Icons.account_circle_outlined,
                    ),
                  ],
                ),
              ),
              verticalSpace(role == 'parent' ? 50.h : 250.h),
            ],
          ),
        ),
      ),
    );
  }
}
