import 'package:cloud_firestore/cloud_firestore.dart';

class Alarm {
  int? alarmID;
  String? alarmState;
  DateTime time;
  int? value;

  Alarm({
    required this.alarmState,
    required this.time,
    // required this.alarmID,
    required this.value,
  });

  factory Alarm.fromSnapshot(DocumentSnapshot snapshot) {
    return Alarm(
      alarmState: snapshot['AlarmState'],
      time: (snapshot['Time'] as Timestamp).toDate(),
      value: snapshot['AlarmValue']
    );
  }
}
