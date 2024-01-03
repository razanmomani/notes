
import 'package:flutter/material.dart';

class TFloatingActionButtonTheme {
  TFloatingActionButtonTheme._();
  //FloatingActionButtonTheme light
  static FloatingActionButtonThemeData lightFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    iconSize: 25,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side:  BorderSide(width: 1,color: Colors.orange),
    ),
  );
//FloatingActionButtonTheme dark
  static FloatingActionButtonThemeData darkFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    iconSize: 25,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side:  BorderSide(width: 1,color: Colors.orange),
    ),


  );

}