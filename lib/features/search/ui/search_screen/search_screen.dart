import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/search/providers/search_provider.dart';
import 'package:mobile_app/features/search/ui/search_screen/search_result.dart';

@RoutePage()
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  bool isSearching = true;
  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);
    final search = ref.watch(searchProvider.notifier);

    Widget header = Text(
      'Searching...',
      style: TextStyles.h1BlackBold,
    );

    if (searchState == SearchState.found) {
      header = Text(
        'We found one for your!',
        style: TextStyles.h1BlackBold,
      );
    }

    if (searchState == SearchState.notFound) {
      header = const Center(
        child: Text('not found'),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(16.h),
            header,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
              width: double.infinity,
              height: 550.h,
              decoration: ShapeDecoration(
                color: searchState == SearchState.found
                    ? Colors.white
                    : ColorsManager.gray.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.w,
                    style: BorderStyle.solid,
                    color: ColorsManager.mainGreen,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60.w)),
                ),
              ),
              child: searchState == SearchState.found
                  ? SearchResult(
                      name: search.hospital!.name,
                      address: search.hospital!.address,
                      phoneNumber: search.hospital!.phoneNumber,
                      city: search.hospital!.city,
                      type: search.hospital!.type,
                    )
                  : Padding(
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
                    ),
            ),
            verticalSpace(10.h),
            Visibility(
              visible: searchState == SearchState.found,
              child: GreenButton(
                text: 'Send Reservation',
                onPressed: () {
                  search.searchAttempt = 0;
                  context.router.push(
                    const ReservationFormRoute(),
                  );
                },
              ),
              // OutlinedButton(
              //   // style: ButtonStyle(shape: Outlined),
              //   child: const Text(
              //     'another hospital',
              //     style: TextStyle(
              //       color: ColorsManager.gray,
              //     ),
              //   ),
              //   onPressed: () {
              //     search.searchAttempt++;
              //   },
              // ),
              // ],
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
