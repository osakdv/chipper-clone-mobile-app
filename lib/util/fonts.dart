import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  final heading1 = GoogleFonts();
  static TextStyle heading2 = GoogleFonts.mulish(
      color: Color.fromARGB(255, 15, 15, 15),
      fontWeight: FontWeight.w700, fontSize: 28);
  static TextStyle labelFont1 =
      GoogleFonts.mulish(color: const Color.fromARGB(255, 61, 124, 249));
  static TextStyle labelFont2 = GoogleFonts.mulish(
      color: const Color.fromARGB(255, 61, 124, 249),
      fontWeight: FontWeight.w700);
  static TextStyle balanceFont = GoogleFonts.dmSans(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 36, 30, 103));
}
