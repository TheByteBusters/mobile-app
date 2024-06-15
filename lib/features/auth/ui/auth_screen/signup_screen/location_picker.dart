import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/features/auth/provider/auth_provider.dart';
import 'package:mobile_app/features/auth/provider/location_provider.dart';

class LocationInput extends ConsumerStatefulWidget {
  const LocationInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationInputState();
}

class _LocationInputState extends ConsumerState<LocationInput> {
  @override
  Widget build(BuildContext context) {
    
    final locationState = ref.watch(locationStateProvider);
    final locationProvider = ref.watch(locationStateProvider.notifier);
    final authentication = ref.watch(authProvider.notifier);

    Widget previewContent = Text(
      'Please press this button at home',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (locationState == LocationInputState.gettingLocation) {
      previewContent = Text(
        'Please wait...',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.grey,
            ),
      );
    }

    if (locationState == LocationInputState.picked ||
        locationState == LocationInputState.submitted) {
      previewContent = Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          horizontalSpace(5.w),
          const Text('Picked Succesfully'),
        ],
      );
    }

    return Column(
      children: [
        InkWell(
          onTap: () async {
            await locationProvider.getCurrentLocation();

            if (locationState != LocationInputState.failed) {
              authentication.location = locationProvider.location;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: locationState == LocationInputState.empty
                    ? Colors.red
                    : Colors.black,
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
                  child: previewContent,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.location_on,
                    color: locationState == LocationInputState.empty
                        ? Theme.of(context).colorScheme.error
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: locationState == LocationInputState.empty,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 18.w),
            child: Text(
              'please provide us with your home location',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12.h,
              ),
            ),
          ),
        )
      ],
    );
  }
}
