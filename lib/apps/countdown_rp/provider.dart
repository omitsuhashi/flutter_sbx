import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

const minute = 1;
final DateTime _pivot = DateTime(0);

final isActiveProvider = StateProvider((_) => false);

class TimerState extends StateNotifier<TimeModel> {
  final StateNotifierProviderRef _ref;
  late final StateController<bool> isActiveController;

  Timer? _timer;

  TimerState(this._ref, TimeModel state) : super(state) {
    isActiveController = _ref.read(isActiveProvider.state);
  }

  start() {
    isActiveController.state = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.time.isAfter(_pivot)) {
        final cd = state.countdown();
        state = TimeModel(_pivot,
            hour: cd.hour, minute: cd.minute, second: cd.second);
      } else {
        // TODO: raise event
        stop();
      }
    });
  }

  stop() {
    isActiveController.state = false;
    _timer?.cancel();
  }

  reset() {
    stop();
    state = TimeModel(_pivot, minute: minute);
  }
}

// 1分をカウントダウン
final timerProvider = StateNotifierProvider<TimerState, TimeModel>(
    (ref) => TimerState(ref, TimeModel(_pivot, minute: minute)));
