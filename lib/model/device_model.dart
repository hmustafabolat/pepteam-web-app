import 'package:cloud_firestore/cloud_firestore.dart';

class Device {
  String deviceName;
  String id;
// (json["permissionStart"] as Timestamp).toDate()
  Device({
    required this.deviceName,
    required this.id,
  });

  factory Device.fromSnapshot(DocumentSnapshot snapshot) {
    return Device(
      deviceName: snapshot['DeviceName'],
      id: snapshot.id,
    );
  }
}
