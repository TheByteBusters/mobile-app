import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/features/incubators_screen/model/incubator_model.dart';
import 'package:mobile_app/features/incubators_screen/repository/incubators_repository.dart';

enum IncubatorsState {
  waiting,
  received,
  empty,
  faild,
}

class IncubatorsNotifier extends StateNotifier<IncubatorsState> {
  IncubatorsNotifier() : super(IncubatorsState.waiting) {
    getIncubators();
  }

  List<Incubator>? incubators;

  Future<void> getIncubators() async {
    state = IncubatorsState.waiting;

    final http.Response response = await IncubatorsRepository.getIncubators();

    if (response.statusCode != 200) {
      state = IncubatorsState.faild;
      return;
    }

    incubators = IncubatorsRepository.parseResponse(response.body);

    if (incubators!.isEmpty) {
      state = IncubatorsState.empty;
    } else {
      state = IncubatorsState.received;
    }

    print(incubators);
  }
}

final incubatorsProvider =
    StateNotifierProvider<IncubatorsNotifier, IncubatorsState>(
  (ref) => IncubatorsNotifier(),
);
