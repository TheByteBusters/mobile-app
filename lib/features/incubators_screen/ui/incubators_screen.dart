import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/incubators_screen/provider/incubators_provider.dart';
import 'package:mobile_app/features/incubators_screen/ui/incubator_tile.dart';

@RoutePage()
class IncubatorsScreen extends ConsumerStatefulWidget {
  const IncubatorsScreen({super.key});

  @override
  ConsumerState createState() => _IncubatorsScreenState();
}

class _IncubatorsScreenState extends ConsumerState {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final incubators = ref.watch(incubatorsProvider.notifier).incubators;
    final incubatorsState = ref.watch(incubatorsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16.h),
              Padding(
                padding: EdgeInsets.only(left: 8.w, bottom: 24.h),
                child: Text(
                  'Incubators list',
                  style: TextStyles.h1BlackBold,
                ),
              ),
              incubatorsState == IncubatorsState.waiting
                  ? Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 180.w, vertical: 220.h),
                      child: const CircularProgressIndicator())
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ListView.builder(
                          itemCount: incubators!.length,
                          itemBuilder: (context, index) {
                            return
                                // Text('hi');
                                IncubatorTile(
                              incubator: incubators[index],
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
