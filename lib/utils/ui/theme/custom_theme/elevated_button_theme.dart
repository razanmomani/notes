import 'package:flutter/material.dart';
class TElevatedButtonTheme{
  TElevatedButtonTheme._();
  //light in buttonTheme
  static final lightElevatdButtonTheme=ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
    //  side:  BorderSide(color: Colors.black,),
      padding:  EdgeInsets.symmetric(vertical: 18),
      textStyle:  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );

  //dark in buttonTheme
  static final darkElevatdButtonTheme=ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      //side:  BorderSide(color: Colors.black,),
      padding:  EdgeInsets.symmetric(vertical: 18),
      textStyle:  TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

    ),
  );
}