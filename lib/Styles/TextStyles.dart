import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle titleTexts(Color color, FontWeight fontWeight, double fontSize){
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

TextStyle h1(double fontSize){
  return TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
  );
}

RoundedRectangleBorder rShapeBorder(double rad){
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(rad)
  );
}

OutlineInputBorder outlineIB(){
  return OutlineInputBorder(

  );
}
