import 'package:cloud_firestore/cloud_firestore.dart';

class Logs {
  int? Humidity;
  DateTime? time;
  double? water;

  Logs({required this.Humidity, required this.time, required this.water});

  factory Logs.fromSnapShot(DocumentSnapshot snapshot) {
    return Logs(
        Humidity: snapshot['Humidity'],
        time: (snapshot['Time'] as Timestamp).toDate(),
        water: snapshot['Water']);
  }
}
