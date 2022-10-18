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
  static TextStyle font12W400()
  {
    return GoogleFonts.plusJakartaSans().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xff574B78)
    );
  }

  static TextStyle font16W600()
  {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white
    );
  }
  static TextStyle font10W500()
  {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: const Color(0xff574B78)
    );
  }
  static TextStyle font16W700()
  {
    return GoogleFonts.plusJakartaSans().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xff574B78)
    );
  }
}

