import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_test/constants/project_custom_colors.dart';

//Uygulama yazı stilleri
class ProjectTextStyles {
  final TextStyle darkBlue_w600_s30 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: ProjectCustomColors().customDarkBlue));
  final TextStyle white_w500_s15 = GoogleFonts.inter(
      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500));
  final TextStyle grey = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600));
}
