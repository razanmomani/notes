import 'package:flutter/material.dart';
class TOutlineButtonTheme{
  TOutlineButtonTheme._();
  //light in buttonTheme
  static final lightOutlinButtonTheme=OutlinedButtonThemeData(
    style:OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
     backgroundColor: Colors.orange,
      disabledForegroundColor: Colors.orange,
      disabledBackgroundColor: Colors.orange,
      side:  BorderSide(color: Colors.orange,),
      padding:  EdgeInsets.symmetric(vertical: 18),
      textStyle:  TextStyle(fontSize: 16,color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side:  BorderSide(color: Colors.orange),
      ),
    ),
  );

  //dark in buttonTheme
  static final darkOutlinButtonTheme=OutlinedButtonThemeData(
    style:OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
       backgroundColor: Colors.orange,
      disabledForegroundColor: Colors.orange,
      disabledBackgroundColor: Colors.orange,
      side:  BorderSide(color: Colors.orange,),
      padding:  EdgeInsets.symmetric(vertical: 18),
      textStyle:  TextStyle(fontSize: 16,color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.orange),

      ),

    ),
  );



}