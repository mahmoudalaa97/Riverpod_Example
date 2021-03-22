import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get backgroundColor =>
      brightness != Brightness.dark ? Color(0xff22252A) : Colors.black12;

  Color get appBarColor =>
      brightness != Brightness.dark ? Color(0xff2d3035) : Colors.red;

  Color get gridViewButtonColor =>
      brightness == Brightness.dark ? Color(0xff4d5259) : Colors.red;
}
