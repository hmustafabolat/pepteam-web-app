import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/model/device_model.dart';
import 'package:ss_test/storage/storage.dart';

import '../../viewModel/dashboard_viewModel.dart';

final DashboardViewModel controller = Get.put(DashboardViewModel());

class FilterPage extends StatefulWidget {
  final Function(
          Device? selectedOption, DateTime? startDate, DateTime? endDate)?
      selectedFunction;
  FilterPage({this.selectedFunction});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Device? selectedOption;
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate ?? DateTime.now(),
        firstDate: DateTime(2012, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
        selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
        selectedEndTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return SizedBox(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.date_range,
              color: ProjectCustomColors().customPurple,
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {
                  _selectStartDate(context);
                },
                child: Text(startDate == null
                    ? 'Başlangıç Tarihi'
                    : formatter.format(startDate!))),
            Text("--"),
            TextButton(
                onPressed: () {
                  _selectEndDate(context);
                },
                child: Text(endDate == null
                    ? 'Bitiş Tarihi'
                    : formatter.format(endDate!))),
            SizedBox(
              width: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  controller.getLogs(
                      selectedOption?.id, selectedStartTime, selectedEndTime);
                });
                /* /* print('Başlangıç Tarihi: $startDate');
                print('Bitiş Tarihi: $endDate'); */
                print(selectedStartTime);
                print(selectedEndTime);
                //print(selectedOption?.id);
                print(selectedDevice.id); */
              },
              icon: Icon(Icons.filter_list),
              label: Text('Filtrele'),
            )
          ],
        ),
      )),
    );
  }
}
