import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ss_test/model/alarm_model.dart';
import 'package:ss_test/model/device_model.dart';
import 'package:ss_test/model/logs_model.dart';
import 'package:ss_test/model/pump_model.dart';
import 'package:ss_test/storage/storage.dart';

class DashboardViewModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;


  RxList<QueryDocumentSnapshot> users = <QueryDocumentSnapshot>[].obs;
  RxList<QueryDocumentSnapshot> alarms = <QueryDocumentSnapshot>[].obs;
  RxList<QueryDocumentSnapshot> pumps = <QueryDocumentSnapshot>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   _getUsers();
  // }


  void _getUser() async {
    QuerySnapshot querySnapshot =
    await _firestore.collection('Users').get();
    users.value = querySnapshot.docs;
  }


  StreamController<List<Pump>> _pumpModelController =
      StreamController<List<Pump>>();
  Stream<List<Pump>> get pumpModelStream => _pumpModelController.stream;

  StreamController<List<Alarm>> _alarmModelController =
      StreamController<List<Alarm>>();
  Stream<List<Alarm>> get alarmModelStream => _alarmModelController.stream;

  StreamController<List<Logs>> _logsModelController =
      StreamController<List<Logs>>();
  Stream<List<Logs>> get logsModelStream => _logsModelController.stream;

  // StreamController<List<User>> _userModelController =
  // StreamController<List<User>>();
  // Stream<List<User>> get userModelStream => _userModelController.stream;

  // var users = [].obs;

  List<Device> devices = [];

  List<Logs> logs = [];

  Device? deviceId;
  Logs? startTime, endTime;

  void getLogs(deviceId, startTime, endTime) {
    if (deviceId == null) {
      deviceId = 'Device1';
    }
    //deviceId ?? "Device1";
    // endTime ?? DateTime.now();
    // startTime ?? DateTime.now().subtract(const Duration(days: 5));
    if (startTime == null && endTime == null) {
      log("tarihler null geldi ");
      startTime = DateTime.now().subtract(const Duration(days: 30));
      endTime = DateTime.now();
    }
    print("--------");
    print(startTime.toString());
    print(endTime.toString());
    print("--------");
    log(deviceId);
    /* startTime = DateTime(2023 - 03 - 07);
    endTime = DateTime(2023 - 04 - 24);
 */
    _firestore
        .collection('Users')
        .doc('User1') // user!.uid yazılacak
        .collection('Devices')
        .doc(deviceId)
        .collection('Logs')
        .where('Time', isLessThan: endTime)
        .where('Time', isGreaterThan: startTime)
        .orderBy('Time', descending: true)
        .snapshots()
        .listen((data) {
      List<Logs> logs = [];
      data.docs.forEach((doc) {
        logs.add(Logs.fromSnapShot(doc));
      });
      deviceLogs.clear();
      deviceLogs = logs;
      _logsModelController.add(logs);
      log("Toplam log sayısı:" + deviceLogs.length.toString());
    });
  }

  getPump(deviceId) async {
    if (deviceId == null) {
      deviceId = 'Device1';
    }
    QuerySnapshot querySnapshot =
        await _firestore
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .doc(deviceId)
        .collection("Pump")
        .orderBy("Time", descending: true)
        .limit(1)
        .get();
    pumps.value = querySnapshot.docs;
  }

  // getPump(deviceId) {
  //   if (deviceId == null) {
  //     deviceId = 'Device1';
  //   }
  //   log('fonksiyon başladı');
  //   _firestore
  //       .collection("Users")
  //       .doc("User1")
  //       .collection("Devices")
  //       .doc(deviceId)
  //       .collection("Pump")
  //       .orderBy("Time", descending: true)
  //       .limit(1)
  //       .snapshots()
  //       .listen((data) {
  //     List<Pump> pumps = [];
  //
  //     data.docs.forEach((doc) {
  //       log(doc['PumpState'].toString());
  //       pumps.add(Pump.fromSnapshot(doc));
  //       print("Modelden gelen : " + pumps.last.pumpState);
  //     });
  //     _pumpModelController.add(pumps);
  //     log(pumps.last.time.toString());
  //   });
  // }

  void getAlarm(deviceId) async {
    if (deviceId == null) {
          deviceId = 'Device1';
        }
    QuerySnapshot querySnapshot =
    await _firestore
        .collection("Users")
        .doc("User1")
        .collection("Devices")
        .doc(deviceId)
        .collection("Alarms")
        .orderBy("Time", descending: true)
        .limit(1).get();
    alarms.value = querySnapshot.docs;
  }

  // void getAlarm(deviceId) {
  //   if (deviceId == null) {
  //     deviceId = 'Device1';
  //   }
  //
  //   _firestore
  //       .collection("Users")
  //       .doc("User1")
  //       .collection("Devices")
  //       .doc(deviceId)
  //       .collection("Alarms")
  //       .orderBy("Time", descending: true)
  //       .limit(1)
  //       .snapshots()
  //       .listen((data) {
  //     List<Alarm> alarms = [];
  //
  //     data.docs.forEach((doc) {
  //       alarms.add(Alarm.fromSnapshot(doc));
  //     });
  //     _alarmModelController.add(alarms);
  //   });
  // }

  // void getUsers(){
  //   _firestore
  //       .collection("Users")
  //       .snapshots()
  //       .listen((data) {
  //     List<User> users = [];
  //
  //     data.docs.forEach((doc) {
  //       users.add(User.fromSnapshot(doc));
  //       print("Modelden gelen : " + users.last.name);
  //     });
  //     _userModelController.add(users);
  //   });
  // }

  // void getUsers() async {
  //   _firestore.collection('Users').get().then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       users.add(doc.data());
  //     });
  //   });
  // }

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
    getLogs(deviceId, null, null);
    getPump(deviceId);
    getAlarm(deviceId);
    // getUsers();
    _getUser();
  }

  @override
  void onClose() {
    _pumpModelController.close();
    _alarmModelController.close();
    super.onClose();
  }
}
