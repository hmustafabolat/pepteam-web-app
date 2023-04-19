import 'package:flutter/material.dart';

class DateRangeSelectionButton extends StatefulWidget {
  @override
  _DateRangeSelectionButtonState createState() =>
      _DateRangeSelectionButtonState();
}

class _DateRangeSelectionButtonState extends State<DateRangeSelectionButton> {
  DateTimeRange? _selectedDateRange;
  String _buttonText = 'Jan 6, 2023 – Jan 13, 2023';


  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
        _buttonText = '${_selectedDateRange!.start} - ${_selectedDateRange!.end}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
          onPressed: () {
            _selectDateRange(context);
          },
          child: Row(
            children: [
              Icon(Icons.date_range, color: Colors.black),
              Text(
                _buttonText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
    );
  }
}
