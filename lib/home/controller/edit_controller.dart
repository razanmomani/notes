/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/home_page/home_screen.dart';
class EditController extends GetxController{
  GlobalKey <FormState> formState=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  FocusNode nameFocus = FocusNode();
  RxString docId=''.obs;
 RxString oldName=''.obs;

  CollectionReference  categories =FirebaseFirestore.instance.collection("Categories");
  editCategories()async{
    if(formState.currentState!.validate()){
      try{
        await categories.doc(docId.value).update({
          'name':nameController.text,
        });
     //   Navigator.of(context).pushNamedAndRemoveUntil('HomePage',(route)=>false);
        Get.to(()=>HomePage());
      }catch(e){
        print('erorr $e');
      }
    }
  }
  @override
  void onInit() {
    super.onInit();
    nameController.text = oldName.value;
  }

}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/tranislation/controller.dart';

import '../screen/home_screen.dart';
class EditController extends GetxController {
  MyController myController = Get.find();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  var oldName=''.obs;
  final CollectionReference categories =
  FirebaseFirestore.instance.collection("Categories");
  @override
  void onInit() {
    super.onInit();
    nameController.text=oldName.value;
  }

  void editCategories(String docId) async {
    if (formState.currentState!.validate()) {
      try {
        await categories.doc(docId).update({
          'name'.tr: nameController.text,

        });
        Get.offAll(() => HomePage());
      } catch (e) {
        print('Error: $e');
      }
    }
  }





}
