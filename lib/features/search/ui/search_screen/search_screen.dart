import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/search/ui/search_screen/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isSearching
                ? const ScreenHeader(
                    title: 'Searching...',
                    subtitle: 'Looking for an incubator for your baby',
                    withLogo: false,
                  )
                : const ScreenHeader(
                    title: 'We found one for your!',
                    subtitle: 'If it does not fit search again',
                    withLogo: false,
                  ),
            Container(
              margin: EdgeInsets.all(30.w),
              width: double.infinity,
              height: 550.h,
              decoration: ShapeDecoration(
                color: isSearching
                    ? ColorsManager.gray.withOpacity(0.2)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.w,
                    style: BorderStyle.solid,
                    color: ColorsManager.mainGreen,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60.w)),
                ),
              ),
              child: isSearching
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 150.w, vertical: 247.h),
                      child: SizedBox(
                        width: 48.w,
                        height: 48.h,
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainGreen,
                          strokeWidth: 7.w,
                        ),
                      ),
                    )
                  : const SearchResult(),
            ),
            verticalSpace(10.h),
            GreenButton(
              text: 'Continue',
              route: '/',
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
