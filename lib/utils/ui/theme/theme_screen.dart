/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Themes {
  final lightTheme = ThemeData.light().copyWith(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
    primaryColor: Colors.blueGrey[300],
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
    primaryColor: Colors.blueGrey[800],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );



}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Themes {
  static const Color primaryColor = Colors.blueGrey; // قم بتحديد اللون الرئيسي هنا
  static const Color appBarColor = Colors.black; // قم بتحديد لون شريط التطبيق هنا
  static const Color appBarContentColor = Colors.white; // قم بتحديد لون محتوى شريط التطبيق هنا
  static const Color buttonColor = Colors.black; // قم بتحديد لون الأزرار هنا
  static const Color textButtonColor = Colors.black; // قم بتحديد لون الأزرار النصية هنا
  static const Color white = Colors.white; // اللون الأبيض

  static final lightTheme = ThemeData.light().copyWith(

    buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
    primaryColor: Colors.blueGrey[300],
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white,
    ),
    primaryColor: Colors.blueGrey[800],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );

  static final customTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: buttonColor,
      color: Colors.black,
      actionsIconTheme: IconThemeData(
        color: appBarContentColor,
      ),
      titleTextStyle: TextStyle(color: appBarContentColor),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        textStyle: const TextStyle(color: white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: textButtonColor),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: buttonColor,
    ),
  );
}
*/
import 'package:flutter/material.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/appbar_theme.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/elevated_button_theme.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/floatingActionButtonTheme.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/outlinebuttontheme.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/text_form_filed_theme.dart';
import 'package:my_notes/utils/ui/theme/custom_theme/text_theme.dart';

class TAppThemes {
  TAppThemes._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatdButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: TTextFormFiledTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: TFloatingActionButtonTheme.lightFloatingActionButton,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlinButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatdButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: TTextFormFiledTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: TFloatingActionButtonTheme.darkFloatingActionButton,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlinButtonTheme,
  );
}