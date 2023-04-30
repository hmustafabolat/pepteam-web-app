import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/model/device_model.dart';
import 'package:ss_test/storage/storage.dart';

import '../../viewModel/dashboard_viewModel.dart';

class FilterPage extends StatefulWidget {
  final VoidCallback? selectedFunction;
  FilterPage({this.selectedFunction});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Device? selectedOption;
  DateTime startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
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
        initialDate: endDate,
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
    return Row(
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
            child: Text(formatter.format(startDate))),
        Text("--"),
        TextButton(
            onPressed: () {
              _selectEndDate(context);
            },
            child: Text(formatter.format(endDate))),
        SizedBox(
          width: 20,
        ),
        ElevatedButton.icon(
          onPressed: widget.selectedFunction,
          icon: Icon(Icons.filter_list),
          label: Text('Filtrele'),
        )
      ],
    );
  }
}
