import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0x5ff06C149);
  static const whiteColor = Colors.white;
  static const BlueColor = Colors.cyan;
  static const grenColor = Colors.white54;
  static const blackColor = Color(0xff181A20);
  static const bgcolorOfApp = Color(0xff181A20);

  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xff24A19C),
        Color(0x4024A19C),
      ]);

  static const primaryDisabledGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color.fromARGB(255, 167, 221, 219),
        Color(0x1524A19C),
      ]);

  static const darkModeColor = Colors.black;

  static textStyleSemiBold({double size = 18, Color textColor = blackColor}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.w600,
      );

  static textStyleNormal(
          {double size = 16,
          Color textColor = blackColor,
          bool isDone = false}) =>
      TextStyle(
          fontSize: size,
          color: textColor,
          fontWeight: FontWeight.w700,
          decoration:
              isDone ? TextDecoration.lineThrough : TextDecoration.none);

  static textStyleBold({double size = 18, Color textColor = blackColor}) =>
      TextStyle(fontSize: size, color: textColor, fontWeight: FontWeight.bold);

  static textStyleSemiRegular(
          {double size = 16, Color textColor = blackColor}) =>
      TextStyle(fontSize: size, color: textColor, fontWeight: FontWeight.w400);

  static textStyleSeeAll({
    double size = 16,
    Color textColor = primaryColor,
  }) =>
      GoogleFonts.urbanist(
          fontSize: 16, fontWeight: FontWeight.w700, color: Style.primaryColor);
}
