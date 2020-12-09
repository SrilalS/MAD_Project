import 'package:flutter/cupertino.dart';

TextStyle titleTexts(Color color, FontWeight fontWeight, double fontSize){
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

RoundedRectangleBorder rShapeBorder(double rad){
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(rad)
  );
}