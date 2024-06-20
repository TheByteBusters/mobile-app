import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/incubators_screen/provider/incubators_provider.dart';
import 'package:mobile_app/features/incubators_screen/ui/incubator_tile.dart';

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
              IconButton(
                onPressed: () {
                  context.pop();
                },
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 24),
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
                            return IncubatorTile(
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
