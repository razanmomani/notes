/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_notes/config/theme/theme_server.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}
class _DrawerScreenState extends State<DrawerScreen> {
  late bool isDarkMode;
  @override
  void initState() {
    super.initState();
    isDarkMode = ThemeServers().isSavedDarkMode();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: 299,
            height: 50,
            child: Card(
              elevation: 5,
              shadowColor: Colors.orange.shade400,
              color: Colors.orange,
              child: Text(
                'Settings',
                style: GoogleFonts.alike(
                  fontSize: 23,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'DarkMode',
                  style: GoogleFonts.alike(fontSize: 22),
                ),
              ),
              Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    ThemeServers().saveThemeMode(value);
                    ThemeServers().changeThemeMode();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller_drwer.dart';
import 'language/language.dart';
class DrawerScreen extends GetView<ThemeController> {
   DrawerScreen({super.key});
   final ThemeController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
              SizedBox(
                width: 299,
                height: 50,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.orange.shade400,
                  color: Colors.orange,
                  child: Text(
                    'Settings',
                    style: GoogleFonts.alike(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Obx(() => SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: GoogleFonts.alike(fontSize: 22),
                ),
                value: controller.themeModel.value.isDarkMode,
                onChanged: (value) {
                  controller.toggleTheme(value);
                },
              )),
             Container(
               margin:  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
               padding: EdgeInsets.all(5),
               child: Row(
                 children: [
                   Text('Language',
                     style: GoogleFonts.alike(fontSize: 22),
                   ),
                   const SizedBox(width: 120,),
                   InkWell(
                     onTap: (){
                       Get.to(()=>LanguageScreen());
                     },
                     child: const Icon(Icons.language_outlined,
                     size: 40,
                     ),
                   ),
                 ],
               ),
             ),




            ],
          ),
      

    );
  }
}
