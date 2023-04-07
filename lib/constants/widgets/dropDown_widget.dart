import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_text_styles.dart';

import '../../model/device_model.dart';

class MyDropDownButton extends StatefulWidget {
  final Function(Device? selectedOption)? selectedFunction;
  MyDropDownButton({this.selectedFunction});
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  Device? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc('User1')
          .collection('Devices')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DropdownMenuItem> dropdownItems = [];
          List<Device> devices = [];
          for (var doc in snapshot.data!.docs) {
            devices.add(Device.fromSnapshot(doc));
            print("Device id:" + devices.last.id);
            print("Device name:" + devices.last.deviceName);

            dropdownItems.add(
              DropdownMenuItem(
                  child: Text(doc.data()["DeviceName"] ?? ""),
                  //value: doc.data()["DeviceName"] ?? "",
                  value: devices.last),
            );
          }

          return Container(
            decoration: BoxDecoration(
              color: ProjectCustomColors().customPurple,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownButton(
                value: _selectedOption,
                items: dropdownItems,
                onTap: () {
                  print(_selectedOption);
                },
                icon: Icon(Icons.add),
                iconDisabledColor: Colors.white,
                iconEnabledColor: Colors.white,
                hint: Text(
                  "Cihaz Seç",
                  style: TextStyle(color: Colors.white),
                ),
                underline: SizedBox(),
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.selectedFunction != null) {
                      log("if içi");
                      widget.selectedFunction!(_selectedOption);
                    }
                  });
                  //   _selectedOption = value;
                  print(_selectedOption?.deviceName);
                }),
          );
        }

        return SizedBox();
      },
    );
  }
}
