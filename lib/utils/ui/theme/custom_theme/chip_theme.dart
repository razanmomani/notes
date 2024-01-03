
import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();
  //ChipTheme light
  static ChipThemeData lightChipTheme=ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor: Colors.white,
  );
//ChipTheme dark
  static ChipThemeData darkChipTheme=ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor: Colors.white,

  );





}