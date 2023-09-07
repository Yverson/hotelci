import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = fromHex('#1C1044');
  static Color appColor = fromHex('#FE8545');
  static Color backgroundColor = fromHex('#F9F9F9');
  static Color borderColor = fromHex('#AFADAD');
  static Color textGreyColor = fromHex('#7D7D7D');
  static Color appTextFeildColor = fromHex('#EBF0F3');

  static Color secondaryColor = fromHex('#261854');
  static Color buttonTextColor = fromHex('#623B82');
  static Color lightBlue = fromHex('#372868');
  static Color cyanColor = fromHex('#4DEEEC');
  static Color gradient1 = fromHex('#22B0FF');
  static Color gradient2 = fromHex('#ABFEBA');
  static Color greenColor = fromHex('#39F5BB');
  static Color yellowColor = fromHex('#F7E584');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
