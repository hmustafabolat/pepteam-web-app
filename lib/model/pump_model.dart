import 'package:cloud_firestore/cloud_firestore.dart';

class Pump {
  String pumpState;
  DateTime time;
// (json["permissionStart"] as Timestamp).toDate()
  Pump({
    required this.pumpState,
    required this.time,
  });

  factory Pump.fromSnapshot(DocumentSnapshot snapshot) {
    return Pump(
      pumpState: snapshot['PumpState'],
      time: (snapshot['Time'] as Timestamp).toDate(),
    );
  }
}
