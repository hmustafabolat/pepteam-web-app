import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_custom_colors.dart';

import '../../model/device_model.dart';

class MyDropDownButton extends StatefulWidget {
  final Function(Device? selectedOption)? selectedFunction;
  MyDropDownButton({this.selectedFunction});
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  Device? selectedOption;
  String? _selectedOptionName;
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
          List<DropdownMenuItem<String>> dropdownItems = [];
          List<Device> devices = [];
          for (var doc in snapshot.data!.docs) {
            Device device = Device.fromSnapshot(doc);
            devices.add(device);
            print("Device id:" + device.id);
            print("Device name:" + device.deviceName);

            dropdownItems.add(DropdownMenuItem(
              child: Text(doc.data()["DeviceName"] ?? ""),
              value: device.id,
            ));
          }

          return Container(
            decoration: BoxDecoration(
              color: ProjectCustomColors().customPurple,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownButton(
              value: selectedOption?.id,
              items: dropdownItems,
              onTap: () {
                print(_selectedOptionName);
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
                  selectedOption =
                      devices.firstWhere((device) => device.id == value);
                  if (widget.selectedFunction != null) {
                    log("if içi");
                    widget.selectedFunction!(selectedOption);
                    print("#3: Seçilen Cihaz: ${selectedOption}");
                  }
                });
                print("#4: ${selectedOption?.deviceName}");
                print("#5: selected value: $value");
              },
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}

class DropButton extends StatefulWidget {
  final void Function(String?) onSelectedIdChanged;

  const DropButton({Key? key, required this.onSelectedIdChanged})
      : super(key: key);

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc('User1')
          .collection('Devices')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        final documents = snapshot.data!.docs;

        final items = documents.map((doc) {
          return DropdownMenuItem<String>(
            value: doc.id,
            child: Text(doc.id),
          );
        }).toList();

        return DropdownButton<String>(
          value: selectedId,
          items: items,
          onChanged: (String? value) {
            setState(() {
              selectedId = value;
            });
            widget.onSelectedIdChanged(value);
          },
        );
      },
    );
  }
}
