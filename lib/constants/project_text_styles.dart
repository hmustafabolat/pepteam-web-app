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
  final TextStyle grey_w500_s14 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ProjectCustomColors().customGrey));
  final TextStyle darkGrey_w500_s14 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ProjectCustomColors().customDarkGrey));
  final TextStyle grey_w400_s14 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customGrey));
  final TextStyle grey = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600));
  final TextStyle grey_w400_s12 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customGrey));
  final TextStyle black_w400_s12 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customDarkBlue));
  final TextStyle white_w400_s12 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customWhiteText));

  final TextStyle darkBlue_w600_s24 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: ProjectCustomColors().customDarkBlue));

  final TextStyle black_w400_s13 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black));
  final TextStyle customPurple_w400_s12 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customPurple));
  final TextStyle customPurple_w400_s14 = GoogleFonts.inter(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ProjectCustomColors().customPurple));
}
