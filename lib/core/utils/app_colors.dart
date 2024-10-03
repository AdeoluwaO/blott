import 'package:flutter/material.dart';

class AppColors {
  static Color primary = _fromHex('#000000');
  static Color white = _fromHex('FFFFFF');
  static Color grey = _fromHex('A3A3A3');
  static Color black = _fromHex('171717');
  static Color transparent = Colors.transparent;
  static Color blue = _fromHex('523AE4');
  static Color prupleBlack = _fromHex('05021B');
  static Color error = _fromHex('F44336');
}

Color _fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
