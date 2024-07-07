import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/app_dropdown_menu.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/search/providers/search_provider.dart';

@RoutePage()
class SearchRequestScreen extends ConsumerWidget {
  const SearchRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider.notifier);

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
              Container(
                height: 300.h,
                padding: EdgeInsets.all(5.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pathological Case',
                      style: TextStyles.h4WhiteSemiBold
                          .copyWith(color: Colors.black),
                    ),
                    verticalSpace(5.h),
                    AppDropdownMenu(
                      items: const {
                        'Oxygen defficiency': 0,
                        'Early birth': 1,
                      },
                      saveFunction: (value) {
                        search.pathologicalCase = value;
                      },
                    ),
                    verticalSpace(20.h),
                    Text(
                      'Class',
                      style: TextStyles.h4WhiteSemiBold
                          .copyWith(color: Colors.black),
                    ),
                    verticalSpace(5.h),
                    AppDropdownMenu(
                      items: const {
                        'Economy': 0,
                        'Charity': 1,
                        'Private': 2,
                        'VIP': 3,
                      },
                      saveFunction: (value) {
                        search.hospitalClass = value;
                      },
                    ),
                    verticalSpace(20.h),
                    Text(
                      'Duration',
                      style: TextStyles.h4WhiteSemiBold
                          .copyWith(color: Colors.black),
                    ),
                    verticalSpace(5.h),
                    AppDropdownMenu(
                      items: const {
                        'less than 30 days': 0,
                        'more than 30 days': 1,
                      },
                      saveFunction: (value) {
                        search.duration = value;
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GreenButton(
                text: 'Continue',
                onPressed: () {
                  search.findHospital(context);
                },
              ),
              verticalSpace(105.h)
            ],
          ),
        ),
      ),
    );
  }
}
