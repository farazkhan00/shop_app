import 'package:flutter/material.dart';

class ColorConstants {
  static MaterialColor primaryColor = MaterialColor(0xff6c60e1, color);
  static const Color primarySimpleColor = Color(0xff6c60e1);
  static const Color background = Color(0xfff8f9ff);

  static Map<int, Color> color = {
    50: const Color.fromRGBO(108, 96, 225, .1),
    100: const Color.fromRGBO(108, 96, 225, .2),
    200: const Color.fromRGBO(108, 96, 225, .3),
    300: const Color.fromRGBO(108, 96, 225, .4),
    400: const Color.fromRGBO(108, 96, 225, .5),
    500: const Color.fromRGBO(108, 96, 225, .6),
    600: const Color.fromRGBO(108, 96, 225, .7),
    700: const Color.fromRGBO(108, 96, 225, .8),
    800: const Color.fromRGBO(108, 96, 225, .9),
    900: const Color.fromRGBO(108, 96, 225, 1),
  };
}
