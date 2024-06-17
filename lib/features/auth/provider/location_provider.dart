import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

enum LocationInputState {
  init,
  gettingLocation,
  picked,
  failed,
  submitted,
  empty,
}

class LocationState extends StateNotifier<LocationInputState> {
  LocationState() : super(LocationInputState.init);
  double? _lat;
  double? _lng;
  double? _acc;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    LocationData locationData;

    state = LocationInputState.gettingLocation;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    try {
      locationData = await location.getLocation();
    } catch (e) {
      state = LocationInputState.failed;
      return;
    }

    state = LocationInputState.picked;

    _lat = locationData.latitude;
    _lng = locationData.longitude;
    _acc = locationData.accuracy;
  }

  bool submitLocation() {
    if (_lat == null || _lng == null || _acc == null) {
      state = LocationInputState.empty;
      return false;
    } else {
      state = LocationInputState.submitted;
      return true;
    }
  }

  get lat {
    return _lat;
  }

  get lng {
    return _lng;
  }

  get acc {
    return _acc;
  }
}

final locationStateProvider =
    StateNotifierProvider<LocationState, LocationInputState>(
  (ref) => LocationState(),
);
