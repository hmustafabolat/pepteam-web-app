import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_text_styles.dart';
import 'package:ss_test/constants/text_field_input_decorations.dart';

class AdminDetailPage extends StatelessWidget {
  // const AdminDetailPage({Key? key}) : super(key: key);

  int _selectedIndex = 0;
  List<String> _buttonNames = [
    'Home',
    'Dashboard',
    'Projects',
    'Tasks',
    'Reporting',
    'Users'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtons(
          direction: Axis.vertical,
          selectedColor: Colors.white,
          renderBorder: false,
          fillColor: Colors.red,
          children: _buttonNames.map((name) {
            return ElevatedButton(
              onPressed: () {
                int index = _buttonNames.indexOf(name);
                _selectedIndex = index;
              },
              child: Text(name, style: ProjectTextStyles().grey_w500_s14),
              style: ElevatedButton.styleFrom(
                primary: _selectedIndex == _buttonNames.indexOf(name)
                    ? Colors.white
                    : Colors.transparent,
                elevation: 0,
              ),
            );
          }).toList(),
          isSelected: List.generate(_buttonNames.length, (index) {
            return _selectedIndex == index;
          }),
        ),
        SizedBox(width: 110),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Şifre'),
            SizedBox(height: 5),
            Text('Şifrenizi değiştirmek için lütfen mevcut şifrenizi giriniz.' ,style: ProjectTextStyles().grey_w400_s14),
            SizedBox(height: 20),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 25),
            Text('Yeni şifre'),
            SizedBox(height: 5),
            TextFormField(
              // onSaved: (value) {
              //   _viewModel.password = value;
              // },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorators().PasswordInput,
            ),
            SizedBox(height: 20),
            Text('Yeni şifreyi onayla'),
            SizedBox(height: 5),
            TextFormField(
              // onSaved: (value) {
              //   _viewModel.password = value;
              // },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorators().PasswordInput,
            ),
            SizedBox(height: 5),
            Text('Yeni şifreniz 8 karakterden uzun olmalıdır.',style: ProjectTextStyles().grey_w400_s14),
            SizedBox(height: 20),
            Text('Yeni şifreyi onayla'),
            SizedBox(height: 5),
            TextFormField(
              // onSaved: (value) {
              //   _viewModel.password = value;
              // },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorators().PasswordInput,
            ),
            SizedBox(height: 45),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: (){},
                        child: Text('İptal' ,style: ProjectTextStyles().darkGrey_w500_s14,)),
                    SizedBox(width: 10),
                    ElevatedButton(onPressed: (){}, child: Text('Şifreyi Güncelle'))
                  ]),
            )
          ],
        ))

      ],
    );
  }
}
