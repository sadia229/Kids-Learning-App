import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_starter/src/styles/k_colors.dart';

class KTextStyle {
  static TextStyle headline1 = const TextStyle(
    fontSize: 31,
    fontWeight: FontWeight.w700,
  );

  static TextStyle kHeadingTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 64,
    fontWeight: FontWeight.w700,
    letterSpacing: 4.0,
  );

  static TextStyle kTitleTextStyle = const TextStyle(
    color: KColor.kTitleTextColor,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'CabinSketch',
  );

  static TextStyle splashStyle = const TextStyle(
    color: Colors.white,
    fontSize: 35,
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

  static TextStyle titleStyle = const TextStyle(
    fontFamily: 'CabinSketch',
    fontWeight: FontWeight.w700,
  );

  static TextStyle backButtonStyle = const TextStyle(
    fontSize: 42,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}
