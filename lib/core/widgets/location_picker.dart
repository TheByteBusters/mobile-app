import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:mobile_app/core/helpers/spacing.dart';

class LocationInput extends ConsumerStatefulWidget {
  const LocationInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationInputState();
}

class _LocationInputState extends ConsumerState<LocationInput> {
  String? _pickedLocation;
  var _isGettingLocation = false;

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    _pickedLocation = 'latitude: $lat, longitude: $lng';

    setState(() {
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'Please press this button at home',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (_isGettingLocation) {
      previewContent = Text(
        'Please wait...',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.grey,
            ),
      );
    }

    if (_pickedLocation != null) {
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

    return InkWell(
      onTap: _getCurrentLocation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Colors.black,
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
              child: previewContent,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: const Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    ); 
  }
}
