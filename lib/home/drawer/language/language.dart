import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_notes/tranislation/controller.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});
  final MyController myController = Get.put(MyController()); // Initializing controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommnViews().getAppBar(
        title: '1'.tr,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                myController.changeLanguage('en');
              },
              child: Text(
                '2'.tr,
                style: GoogleFonts.alike(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                myController.changeLanguage('ar');              },
              child: Text(
                '3'.tr,
                style: GoogleFonts.alike(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
