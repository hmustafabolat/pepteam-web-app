import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/model/device_model.dart';

class FilterPage extends StatefulWidget {
  final Function(Device? selectedOption, DateTime? startDate, DateTime? _endDate)? selectedFunction;
  FilterPage({this.selectedFunction});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Device? selectedOption;
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _startDate ?? DateTime.now(),
        firstDate: DateTime(2012, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _endDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
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
                child: Text(_startDate == null
                    ? 'Başlangıç Tarihi'
                    : formatter.format(_startDate!))),
            Text("--"),
            TextButton(
                onPressed: () {
                  _selectEndDate(context);
                },
                child: Text(_endDate == null
                    ? 'Bitiş Tarihi'
                    : formatter.format(_endDate!))),
            SizedBox(
              width: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Filtreleme işlemi yapmak için seçilen tarihleri kullanabilirsiniz
                print('Başlangıç Tarihi: $_startDate');
                print('Bitiş Tarihi: $_endDate');
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
