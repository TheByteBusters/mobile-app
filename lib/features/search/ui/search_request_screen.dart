import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';

class SearchRequestScreen extends StatelessWidget {
  const SearchRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'Get ready for search!',
                subtitle: 'choose what suites you',
                withReturn: true,
              ),
              verticalSpace(36.h),
              const AppDropdownMenu(items: {
                'Pathological Case': 0,
                'Oxygen defficiency': 1,
                'Early birth': 2,
              }),
              verticalSpace(20.h),
              const AppDropdownMenu(items: {
                'Class': 0,
                'Charity': 1,
                'Economy': 2,
                'Private': 3,
                'VIP': 4,
              }),
              verticalSpace(20.h),
              const AppDropdownMenu(items: {
                'Duration': 0,
                'less than 30 days': 1,
                'more than 30 days': 2,
              }),
              const Spacer(),
              const GreenButton(
                text: 'Continue',
                route: Routes.searchingScreen,
              ),
              verticalSpace(105.h)
            ],
          ),
        ),
      ),
    );
  }
}
