import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/profile/ui/profile_screen/profile_divider.dart';
import 'package:mobile_app/features/profile/ui/profile_screen/profile_tile.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final String userName = AuthCache.getCacheData('name')!;
    final String city = AuthCache.getCacheData('city')!;
    final String email = AuthCache.getCacheData('email')!;
    final String phoneNumber = AuthCache.getCacheData('phone_number')!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 40.h),
        color: ColorsManager.mainGreen,
        child: Stack(
          children: [
            // wing right
            Container(
              margin: EdgeInsets.only(top: 60.h),
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/wings_right.png',
                height: 250.h,
              ),
            ),
            // wing left
            Container(
              margin: EdgeInsets.only(top: 60.h),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/wings_left.png',
                height: 250.h,
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Column(
              children: [
                verticalSpace(80.h),
                SizedBox(
                  width: double.infinity,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 120.w,
                  ),
                ),
                verticalSpace(20.h),
                Text(userName, style: TextStyles.h4WhiteSemiBold),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.w),
                  ),
                ),
                child: Column(
                  children: [
                    verticalSpace(80.h),
                    ProfileTile(
                      titleText: email,
                      leadingIcon: Icons.email_outlined,
                    ),
                    const ProfileDivider(),
                    ProfileTile(
                      titleText: city,
                      leadingIcon: Icons.location_on_outlined,
                    ),
                    const ProfileDivider(),
                    const ProfileTile(
                      titleText: '30205161100779',
                      leadingIcon: Icons.badge_outlined,
                    ),
                    const ProfileDivider(),
                    ProfileTile(
                      titleText: phoneNumber,
                      leadingIcon: Icons.phone_outlined,
                    ),
                    const ProfileDivider(),
                    ListTile(
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red[400],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: ColorsManager.offwhite,
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.red[400],
                        ),
                      ),
                      tileColor: Colors.blueGrey.shade50,
                      onTap: () async {
                        await AuthCache.insert('token', '');
                        if (context.mounted) {
                          context.pushReplacementNamed(Routes.authScreen);
                        }
                      },
                    ),
                    const ProfileDivider(),
                    verticalSpace(100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
