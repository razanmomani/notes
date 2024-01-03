import 'package:get/get.dart';
import 'package:my_notes/utils/ui/theme/theme_server.dart';

import 'model_drwer.dart';

class ThemeController extends GetxController {
  var themeModel = ThemeModel().obs; // Create observable of ThemeModel
  void toggleTheme(bool value) {
    themeModel.update((val) {
      val!.isDarkMode = value;
    });
  ThemeServers().saveThemeMode(value);
   ThemeServers().toggleThemeMode();
  }
}

