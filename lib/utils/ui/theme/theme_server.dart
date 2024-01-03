 //use save in data in get storage
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ThemeServers {
  final _getStorge = GetStorage();
  final storgeKey = 'isDarkMode';
  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
  bool isSavedDarkMode() {
    return _getStorge.read(storgeKey) ?? false;
  }
  void saveThemeMode(bool isDarkMode) {
    _getStorge.write(storgeKey, isDarkMode);
  }
  /*void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(isSavedDarkMode());
  }*/
  void toggleThemeMode() {
    bool isDarkMode = isSavedDarkMode();
    saveThemeMode(!isDarkMode);
    Get.changeThemeMode(getThemeMode());
  }


}
