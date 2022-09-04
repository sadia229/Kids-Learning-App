import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_starter/styles/k_colors.dart';
//import 'package:google_fonts/google_fonts.dart';

class KTextStyle {
  static TextStyle headline1 = TextStyle(
    fontSize: 31,
    fontWeight: FontWeight.w700,
    //fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle kHeadingTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 64,
    fontWeight: FontWeight.w700,
    letterSpacing: 4.0,
  );

  static TextStyle kTitleTextStyle = TextStyle(
    color: KColor.kTitleTextColor,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'CabinSketch',
  );

  static TextStyle subtitle1 = const TextStyle(
    color: KColor.kTextLightColor,
    fontSize: 24,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.indieFlower().fontFamily,
  );
}
