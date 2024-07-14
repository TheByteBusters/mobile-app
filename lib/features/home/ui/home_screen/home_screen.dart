import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/home/provider/progress_provider.dart';
import 'package:mobile_app/features/home/ui/home_screen/app_banner.dart';
import 'package:mobile_app/features/home/ui/home_screen/biometrics_list/biometrics_list.dart';
import 'package:mobile_app/features/home/ui/home_screen/progress_container.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void launchURL(BuildContext context) async {
    final url = Uri.https('egyptiancurebank.com');

    if (await launcher.canLaunchUrl(url)) {
      await launcher.launchUrl(url);
    } else {
      if (!context.mounted) throw 'Could not launch the url';

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('could\'t redirect to egyptiancurebank'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressState = ref.watch(progressProvider);
    print('this is progress state from home: ${progressState.index}');
    var name = AuthCache.getCacheData('name');
    print('name: $name');
    name = name.substring(0, name.indexOf(' '));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $name',
                      style: TextStyles.h1BlackBold,
                    ),
                    Text(
                      'Because every life is precious',
                      style: TextStyles.h4BlackNormal,
                    ),
                    verticalSpace(10),
                    AppBanner(
                      title: 'donate!',
                      withSmallerTitle: false,
                      firstLine: 'Your donation to the Egyptian Shifa Bank',
                      secondLine: 'saves newbons from death',
                      image: 'assets/images/baby.png',
                      onPressed: () {
                        launchURL(context);
                      },
                      withIcon: true,
                    ),
                    verticalSpace(16),
                    Visibility(
                      visible: progressState == ProgressState.connected,
                      child: const SizedBox(
                        height: 110,
                        child: BiometricsList(),
                      ),
                    ),
                    verticalSpace(16.h),
                    Visibility(
                      visible:
                          progressState.index >= 2 && progressState.index < 6,
                      child: const AppBanner(
                        title: 'El-Aasar El-Takhasosy Hospital',
                        withSmallerTitle: true,
                        firstLine: 'Damietta, El-Cornishe St',
                        secondLine: 'Damietta Governorate',
                        withIcon: false,
                        image: 'assets/images/damietta_hospital.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(6.h),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.mainGreen,
                  ),
                ),
                horizontalSpace(6.w),
                Text(
                  'Progress',
                  style: TextStyles.h1BlackBold,
                ),
              ],
            ),
            verticalSpace(16.h),
            const ProgressContainer(),
            verticalSpace(16.h),
          ],
        ),
      ),
    );
  }
}
