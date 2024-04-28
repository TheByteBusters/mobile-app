import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/home/ui/home_screen/navigation_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'Welcome!',
                subtitle: 'We will help you find an incubator',
                withReturn: true,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 80.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      border: Border.all(
                        width: 1,
                        color: ColorsManager.gray,
                      ),
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.search,
                        size: 100.h,
                        color: ColorsManager.mainGreen,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NavigationButton(
                    route: '/home/searchRequestScreen',
                    icon: Icons.handshake_outlined,
                  ),
                  horizontalSpace(20.w),
                  const NavigationButton(
                    route: Routes.monitoringScreen,
                    icon: Icons.monitor_heart_outlined,
                  ),
                  horizontalSpace(20.w),
                  const NavigationButton(
                    route: '/home/searchRequestScreen',
                    icon: Icons.account_circle_outlined,
                  ),
                ],
              ),
              verticalSpace(50.h),
            ],
          ),
        ),
      ),
    );
  }
}
