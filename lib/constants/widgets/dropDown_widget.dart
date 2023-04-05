import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_text_styles.dart';

class MyDropDownButton extends StatefulWidget {
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc('User1')
          .collection('Devices')
          .orderBy('Devices', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("#1");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          print("#2");
          print(snapshot.data!.docs.length);
          List<DropdownMenuItem> dropdownItems = [];
          snapshot.data!.docs.forEach((doc) {
            print(doc);
            dropdownItems.add(
              DropdownMenuItem(
                child: Text(doc['DeviceName']),
                value: doc['DeviceName'],
              ),
            );
          });
          print("#3");
          return Container(
            decoration: BoxDecoration(
              color: ProjectCustomColors().customPurple,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownButton(
                value: _selectedOption,
                items: dropdownItems,
                onTap: () {},
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
                    print("#4");
                  });
                  print("#5: selected value: $value");
                }),
          );
        }
        return SizedBox();
      },
    );
  }
}
