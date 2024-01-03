import 'package:flutter/material.dart';
class TTextFormFiledTheme {
  TTextFormFiledTheme._();
//light text form filed
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.orange,
    suffixIconColor: Colors.orange,
    labelStyle: const TextStyle(color: Colors.orange),
    hintStyle: const TextStyle(fontSize: 14, color: Colors.orange),
    errorStyle: const TextStyle()
        .copyWith(fontStyle: FontStyle.normal, color: Colors.red),
    //   floatingLabelStyle: const TextStyle(fontStyle: FontStyle.normal, color: Colors.red).copyWith(),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );
//dark text form filed
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.orange,
    suffixIconColor: Colors.orange,
    labelStyle: const TextStyle(fontSize: 14, color: Colors.orange).copyWith(),
    hintStyle: const TextStyle(fontSize: 14, color: Colors.orange).copyWith(),
    errorStyle:
        const TextStyle(fontStyle: FontStyle.normal, color: Colors.orange)
            .copyWith(),
    //  floatingLabelStyle: TextStyle(backgroundColor: Colors.orange, fontStyle: FontStyle.normal, color: Colors.white.withOpacity(0.5)).copyWith(),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 2, color: Colors.orange),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.orange),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );
}
