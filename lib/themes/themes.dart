import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishclr = Color(0xFF4e5ae8);
const Color yellowishclr = Color(0xFFFFB746);
const Color pinkclr = Color(0xFFff4667);
const Color whiteclr = Colors.white;
const primaryclr = bluishclr;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryclr,
      brightness: Brightness.light);

  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);

  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ));
  }

  TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ));
  }

  TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ));
  }
}
