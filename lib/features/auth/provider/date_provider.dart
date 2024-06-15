import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InputState {
  init,
  submitted,
  picked,
  empty,
}

class DateState extends StateNotifier<InputState> {
  DateState() : super(InputState.init);
  String _date = '';

  void setDate(String value) {
    _date = value;
    state = InputState.picked;
  }

  bool submitDate() {
    if (_date == '') {
      state = InputState.empty;
      return true;
    } else {
      state = InputState.submitted;
      return false;
    }
  }

  get date {
    return _date;
  }
}

final dateStateProvider = StateNotifierProvider<DateState, InputState>(
  (ref) => DateState(),
);
