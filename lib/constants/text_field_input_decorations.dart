import 'package:flutter/material.dart';
import 'package:ss_test/constants/project_custom_colors.dart';

class InputDecorators {
  final FullNameInput = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(14, 10, 14, 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    hintText: 'Ad, Soyad Giriniz',
    fillColor: Colors.white,
    filled: true,
  );
  final EmailInput = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(14, 10, 14, 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    hintText: 'E-mail Giriniz',
    fillColor: Colors.white,
    filled: true,
  );
  final PasswordInput = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(14, 10, 14, 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ProjectCustomColors().customPaleGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    hintText: '••••••••',
    fillColor: Colors.white,
    filled: true,
  );
}
