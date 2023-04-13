import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/alarm_model.dart';
import 'package:ss_test/model/device_model.dart';
import 'package:ss_test/model/pump_model.dart';
import 'package:ss_test/storage/storage.dart';


class DashboardViewModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  StreamController<List<Pump>> _pumpModelController = StreamController<List<Pump>>();
  Stream<List<Pump>> get pumpModelStream => _pumpModelController.stream;

  StreamController<List<Alarm>> _alarmModelController = StreamController<List<Alarm>>();
  Stream<List<Alarm>> get alarmModelStream => _alarmModelController.stream;

  List<Device> devices = [];

  String? _selectedId;

  String? get selectedId => _selectedId;

  // void onSelectedIdChanged(String? value) {
  //   _selectedId = value;
  //   getPump(_selectedId);
  //   update();
  //
  //   log('fonksiyona girdi');
  // }

  void getPump(String deviceId){
    log('fonksiyon başladı');
    _firestore
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .doc(deviceId)
        .collection("Pump")
        .orderBy("Time", descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      List<Pump> pumps = [];

      data.docs.forEach((doc) {
        log(doc['PumpState'].toString());
        pumps.add(Pump.fromSnapshot(doc));
        print("Modelden gelen : " + pumps.last.pumpState);

      });
      _pumpModelController.add(pumps);
      log(pumps.last.time.toString());
    });

  }

  @override
  void onInit() {
    super.onInit();

    _firestore
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Device tempDevice = Device.fromSnapshot(doc);
        devices.add(tempDevice);
        print("Ekelenen device id: " + devices.last.id);
      });
    });

    // if(_selectedId !=  null){
    //   getPump();
    // }

    _firestore
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .doc("Device1")
        .collection("Alarms")
        .orderBy("Time", descending: true)
        .limit(1)
        .snapshots()
        .listen((data) {
      List<Alarm> alarms = [];

      data.docs.forEach((doc) {
        alarms.add(Alarm.fromSnapshot(doc));
      });
      _alarmModelController.add(alarms);
    });
  }

  @override
  void onClose() {
    _pumpModelController.close();
    _alarmModelController.close();
    super.onClose();
  }

/* Future<List<Alarm>> getAlarms() async {
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
  } */
}