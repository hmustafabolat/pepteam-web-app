import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/alarm_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DashboardViewModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Alarm>> getAlarms() async {
    log("get alarm");
    List<Alarm> tempList = [];
    await _firestore

        ///Users/User1/Devices/Device1/Alarms
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .doc("Device1")
        .collection("Alarms")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        tempList.add(Alarm(
          //     alarmID: doc["AlarmID"],
          time: null,
          alarmState: doc["AlarmState"],
          value: doc["AlarmValue"],
        ));
        // print(doc.data());
        log("Son eklenen alarm value: ${tempList.last.value}");
        log("Son eklenen alarm state: ${tempList.last.alarmState}");
      }
    });

    return tempList;
  }
}
