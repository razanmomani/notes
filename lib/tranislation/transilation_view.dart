/*
import 'package:get/get.dart';
import 'package:my_notes/utils/language/ar.dart';
import 'package:my_notes/utils/language/en.dart';

class Translation extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    'en':en,
    'ar':ar,
  };

}*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_notes/utils/language/ar.dart';
import 'package:my_notes/utils/language/en.dart';
class Translation extends Translations {
  static final box = GetStorage(); // Initialize GetStorage
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };
  static changeLanguage(String lang) {
    box.write('language', lang); // Store selected language
    Get.updateLocale(Locale(lang)); // Update the locale
  }
  static String? getSelectedLanguage() {
    return box.read('language'); // Retrieve selected language
  }
}
