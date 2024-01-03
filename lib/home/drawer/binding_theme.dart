import 'package:get/get.dart';


import 'controller_drwer.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
