import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/alarm_model.dart';

class DashboardViewModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  StreamController<List<String>> _pumpController = StreamController<List<String>>();
  Stream<List<String>> get pumpStream => _pumpController.stream;

  @override
  void onInit() {
    super.onInit();
    _firestore
        .collection("Users")
          .doc("Users1")
          .collection("Devices")
          .doc("Devices1")
          .collection("Pump")
          .orderBy("Time",descending: true)
          .limit(1)
          .snapshots()
        .listen((data) {
      List<String> items = [];
      data.docs.forEach((doc) {
        items.add(doc['name']);
      });
      _pumpController.add(items);
    });
  }

  @override
  void onClose() {
    _pumpController.close();
    super.onClose();
  }


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