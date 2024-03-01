import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double getH() {
    return (this /896) * height;
  }

  double getW() {
    return (this /414) * width;
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}