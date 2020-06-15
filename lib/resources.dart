import 'package:flutter/material.dart';

class Resources {
  // 050606
  // 47494B
  // D11302
  // A30D02
  // 5D0F04
  // CA5421
  // F5A691

  Color black = Color(0xff050606);
  Color lightBlack = Color(0xff47494B);
  Color red = Color(0xffD11302);
  Color deepRed = Color(0xffA30D02);
  Color deepDeepRed = Color(0xff5D0F04);
  Color orange = Color(0xffCA5421);
  Color lightOrange = Color(0xffF5A691);

  String f1 = 'Poppins';
  String f2 = 'Raleway';

  TextStyle style(Color color, double size, String font, {isBold = false}) {
    return TextStyle(
      color: color,
      fontFamily: font,
      fontSize: size,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
    );
  }
}