import 'package:cloud_firestore/cloud_firestore.dart';

class Logs {
  int? humidity;
  DateTime? time;
  double? water;

  Logs({required this.humidity, required this.time, required this.water});
  factory Logs.fromSnapShot(DocumentSnapshot snapshot) {
    return Logs(
        humidity: snapshot['Humidity'],
        time: (snapshot['Time'] as Timestamp).toDate(),
        water: snapshot['Water']);
  }
}
