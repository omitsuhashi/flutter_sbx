class TimeModel {
  late final DateTime time;
  late final DateTime pivot;

  TimeModel(this.pivot, {hour = 0, minute = 0, second = 0}) {
    time = pivot.add(Duration(hours: hour, minutes: minute, seconds: second));
  }

  String get displayTime {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final second = time.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }

  DateTime countdown() {
    return time.add(const Duration(seconds: -1));
  }
}
