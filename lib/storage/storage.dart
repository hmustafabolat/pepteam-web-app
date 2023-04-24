import 'package:ss_test/model/device_model.dart';

import '../model/logs_model.dart';

Device selectedDevice = Device(deviceName: '', id: '');
String selectedId = '';
List<Logs> deviceLogs = [];
DateTime selectedStartTime = DateTime.now().subtract(const Duration(days: 30));
DateTime selectedEndTime = DateTime.now();
