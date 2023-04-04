class Alarm {
  int? alarmID;
  String? alarmState;
  DateTime? time;
  int? value;

  Alarm({
    required this.alarmState,
    required this.time,
    // required this.alarmID,
    required this.value,
  });
}
