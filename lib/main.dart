import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_notes/firebase_options.dart';
import 'package:my_notes/login/login_screen.dart';
import 'package:my_notes/regester/regester_screen.dart';
import 'package:my_notes/tranislation/controller.dart';
import 'package:my_notes/tranislation/transilation_view.dart';
import 'package:my_notes/utils/helper/notifcation.dart';
import 'package:my_notes/utils/ui/theme/theme_screen.dart';
import 'package:my_notes/utils/ui/theme/theme_server.dart';

import 'home/drawer/binding_theme.dart';
import 'home/screen/add_screen.dart';
import 'home/screen/home_screen.dart';
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        FlutterNotificationView().showNotification(notification.title!, notification.body!);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.put(MyController());
    return GetMaterialApp(
      initialBinding: ThemeBinding(), // Add the binding here
      theme: TAppThemes.lightTheme,
      darkTheme: TAppThemes.darkTheme,
      themeMode: ThemeServers().getThemeMode(),
      translations:Translation() ,
      locale: Locale(Translation.getSelectedLanguage() ?? 'en'),
      fallbackLocale: Locale('en'),
      home: FirebaseAuth.instance.currentUser != null
          ? HomePage()
          : LoginScreen(),
      //LoginScreen(),
      routes: {
        "RegesterScreen": (context) => RegesterScreen(),
        "LoginScreen": (context) => LoginScreen(),
        "HomePage": (context) => HomePage(),
        "addCatogries": (context) => AddCategories(),
      },
      debugShowCheckedModeBanner: false,
    );
    }
}
