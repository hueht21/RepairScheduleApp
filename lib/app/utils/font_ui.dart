import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class HomeMap

class FontStyleHomeMap {
  static TextStyle font20BoldP() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: const Color(0xff574B78));
  }

  static TextStyle font15() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 15,
        //fontWeight: FontWeight.bold,
        color: const Color(0xff574B78));
  }
  static TextStyle font13W200() {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w200,
        color: const Color(0xff574B78));
  }
}
