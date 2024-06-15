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
  Map<String, double>? _location;

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

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    _location = {'lat': lat!, 'lng': lng!};
  }

  bool submitLocation() {
    if (_location == null) {
      state = LocationInputState.empty;
      return false;
    } else {
      state = LocationInputState.submitted;
      return true;
    }
  }

  get location {
    return _location;
  }
}

final locationStateProvider =
    StateNotifierProvider<LocationState, LocationInputState>(
  (ref) => LocationState(),
);
