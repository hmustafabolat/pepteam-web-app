import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_custom_colors.dart';
import 'package:ss_test/constants/project_text_styles.dart';

class MyDropDownButton extends StatefulWidget {
  final Function(String? selectedOption)? selectedFunction;
  MyDropDownButton({this.selectedFunction});
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc('User1')
          .collection('Devices')
          .snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data?.docs.length);

        if (snapshot.hasData) {
          print("#2");
          print(snapshot.data!.docs.length);
          List<DropdownMenuItem> dropdownItems = [];
          for (var doc in snapshot.data!.docs) {
            print(doc.data());

            dropdownItems.add(
              DropdownMenuItem(
                child: Text(doc.data()["DeviceName"] ?? ""),
                value: doc.data()["DeviceName"] ?? "",
              ),
            );
          }
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
                    if (widget.selectedFunction != null)
                      widget.selectedFunction!(_selectedOption);

                    print("Seçilen Cihaz: ${_selectedOption}");
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
