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

//YÖNTEM 1
/* class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? _selectedItem;
  List<DropdownMenuItem<String>> items = [];

  Future<void> fetchData() async {
    QuerySnapshot snapshot = (await FirebaseFirestore.instance
          ..collection('Users').doc('User1').collection('Devices').get())
        as QuerySnapshot<Object?>;
    List<DropdownMenuItem<String>> fetchedItems = [];
    snapshot.docs.forEach((doc) {
      fetchedItems.add(DropdownMenuItem(
        child: Text(doc["DeviceName"]),
        value: doc["DeviceName"],
      ));
    });

    setState(() {
      items = fetchedItems;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _selectedItem,
        items: items,
        hint: Text("Cihaz Seç"),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
        });
  }
}
 */
//YÖNTEM 2
/* StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("currency").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> currencyItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        currencyItems.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.documentID,
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.coins,
                              size: 25.0, color: Color(0xff11b719)),
                          SizedBox(width: 50.0),
                          DropdownButton(
                            items: currencyItems,
                            onChanged: (currencyValue) {
                              final snackBar = SnackBar(
                                content: Text(
                                  'Selected Currency value is $currencyValue',
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedCurrency = currencyValue;
                              });
                            },
                            value: selectedCurrency,
                            isExpanded: false,
                            hint: new Text(
                              "Choose Currency Type",
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                          ),
                        ],
                      );
                    }
                  }), */

                  //YÖNTEM 3
 /*   List<String> drinks = List();

Future<List<String>> get drinks async {
  QuerySnapshot docs = await _constantes.getDocuments();
  List<String> res = List();
  List<Map<String, dynamic>> datos = List();

  for (var d in docs.documents) {
    datos.add(d.data);
  }

  for (var d in datos[0]['drinks'].toList()) {
    res.add(d.toString());
  }

  setState(() {
    drinks = res;
  });

  return res;
}

DropdownButtonFormField(
      hint: Text('Choose a drink'),
      value: _currentDrink ?? 'Water',
      items: drinks == null? []: drinks.map((drink) {
          return DropdownMenuItem<String>(
         child: Text(drink),
             value: drink,
              );
          }).toList(),
            onChanged: (val) => setState(() => _currentDrink = val),
), */