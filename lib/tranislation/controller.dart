/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/lociale/app_constant.dart';
import 'package:my_notes/lociale/model_transilation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalizationController extends GetxController implements GetxService {
  late final SharedPreferences sharedPreferences;
  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(
    AppConstant.languages[0].languageCode,
    AppConstant.languages[0].languageName,
  );
  Locale get locale => _locale;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;
  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(AppConstant.LANGUAGE_CODE) ??
            AppConstant.languages[0].languageCode,
        sharedPreferences.getString(AppConstant.LANGUAGE_NAME) ??
            AppConstant.languages[0].languageName);

    for (int index = 0; index < AppConstant.languages.length; index++) {
      if (AppConstant.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstant.languages);
    update();
  }
}
*/
import 'package:get/get.dart';
import 'package:my_notes/tranislation/transilation_view.dart';
class MyController extends GetxController {
  void changeLanguage(String lang) {
    Translation.changeLanguage(lang);
  }
  String? getSelectedLanguage() {
    return Translation.getSelectedLanguage();
  }
}
/*
// لاحقًا في التطبيق، يمكنك استخدام MyController لتغيير اللغة
MyController myController = Get.find();
myController.changeLanguage('ar'); // لتغيير اللغة إلى العربية مثلاً*/
