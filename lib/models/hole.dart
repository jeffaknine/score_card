import 'package:flutter/material.dart';

enum TeeColor {
  // black,
  white,
  yellow,
  blue,
  red;

  Color get color {
    switch (this) {
      // case TeeColor.black:
      //   return Colors.black;
      case TeeColor.white:
        return Colors.white;
      case TeeColor.yellow:
        return Colors.yellow;
      case TeeColor.blue:
        return Colors.blue;
      case TeeColor.red:
        return Colors.red;
    }
  }
}

class Hole {
  final int number;
  final int par;
  final int handicap;
  final int distanceBlack;
  final int distanceWhite;
  final int distanceYellow;
  final int distanceBlue;
  final int distanceRed;
  Hole({
    required this.number,
    required this.par,
    required this.handicap,
    this.distanceBlack = 0,
    this.distanceWhite = 0,
    this.distanceYellow = 0,
    this.distanceBlue = 0,
    this.distanceRed = 0,
  });

  int distance(TeeColor color) {
    switch (color) {
      // case TeeColor.black:
      //   return distanceBlack;
      case TeeColor.white:
        return distanceWhite;
      case TeeColor.yellow:
        return distanceYellow;
      case TeeColor.blue:
        return distanceBlue;
      case TeeColor.red:
        return distanceRed;
    }
  }
}
