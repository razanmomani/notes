/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_notes/home_page/model_home.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';
class HomeController extends GetxController {
  var data = <HomeModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  void fetchData() {
    FirebaseFirestore.instance.collection('Categories').snapshots().listen((snapshot) {
      data.assignAll(snapshot.docs.map((doc) => HomeModel(id: doc.id, name: doc['name'])).toList());
    });
  }
//جلب الداتا من فاير بيس
 Future<void> signOut() async {
    try {
      LoadingScreen.shared.startLoading(Get.context);
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('LoginScreen');
      LoadingScreen.shared.stopeLoading();
    } catch (error) {
      if (error is FirebaseException) {
        print('erorr $error');
      } else {
      }
      LoadingScreen.shared.stopeLoading();
    }
  }


  Future<void> deleteCategory(String categoryId) async {
    LoadingScreen.shared.startLoading(Get.context);
    await FirebaseFirestore.instance.collection('Categories').doc(categoryId).delete();
    LoadingScreen.shared.stopeLoading();
    Get.offAllNamed('HomePage');
  }
}





*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';

import '../model/model_home.dart';
class HomeController extends GetxController {
  RxList<HomeModel> categories = <HomeModel>[].obs;

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Categories')
          .where('id'.tr, isEqualTo: FirebaseAuth.instance.currentUser!.uid.tr)
          .get();
      categories.assignAll(querySnapshot.docs.map((doc) {
        return HomeModel(id: doc.id.tr, name: doc['name'.tr]);
      }).toList());
    } catch (error) {
      print("36 $error".tr);
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('LoginScreen');
    } catch (error) {
      if (error is FirebaseException) {
        Get.snackbar('Failed', FirebaseErrors.getMessage(error.code));
      } else {
        Get.snackbar('Failed', error.toString());
      }
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Categories')
          .doc(categoryId.tr)
          .delete();
      categories.removeWhere((category) => category.id.tr == categoryId.tr);
      Get.offNamed('HomePage');
    } catch (error) {
      print("24 $error".tr);
    }
  }
}
