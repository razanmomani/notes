import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/tranislation/controller.dart';
class AddController extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  MyController myController = Get.find();
  GlobalKey <FormState> formState=GlobalKey<FormState>();
  final CollectionReference categories =
  FirebaseFirestore.instance.collection("Categories");
  addUser() async {
    try {
      if (nameController.text.isNotEmpty) {
        await categories.add({
          'name'.tr: nameController.text.tr,
          'id'.tr: FirebaseAuth.instance.currentUser!.uid.tr,
        });

        update();
        Get.offNamed('HomePage');
      } else {
        // Handle empty name case
        Get.snackbar('18'.tr, '29'.tr);
      }
    } catch (e) {
      print('18 $e'.tr);
      // Handle error
      Get.snackbar('18'.tr, '30'.tr);
    }
  }

}






