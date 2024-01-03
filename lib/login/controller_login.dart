import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';

import '../home/screen/home_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  RxString emailErorr = ''.obs;
  RxString passwordErorr = ''.obs;
  RxBool isPasswordObscure = false.obs;

  //fun
  void login(String email, String password) async {
    try {
      if (isValed(email, password)) {
        LoadingScreen.shared.startLoading(Get.context);
        UserCredential response = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (response.user != null) {
          LoadingScreen.shared.stopeLoading();
          print('Registration successful: ${response.user!.uid}');

          CommnViews().showSnackBar('37'.tr, '38'.tr);
          Get.to(() => HomePage());
          // Fip5Navigator.of(Get.context!).pushAndRemoveUntil(HomePage());
        } else {
          //erorr failed
          CommnViews().showSnackBar('39'.tr, ' 40'.tr);
        }
      }
    } catch (erorr) {
      LoadingScreen.shared.stopeLoading();
      if (erorr is FirebaseException) {
        CommnViews()
            .showSnackBar('41'.tr, FirebaseErrors.getMessage(erorr.code));
      } else {
        CommnViews().showSnackBar('41'.tr, erorr.toString());
      }
    }
  }

  bool isValed(String email, String password) {
    emailErorr.value = '';
    passwordErorr.value = '';
    if (email.isEmpty) {
      emailErorr.value = '42'.tr;
      return false;
    } else if (password.isEmpty) {
      passwordErorr.value = ' 43'.tr;
      return false;
    }
    return true;
  }

  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }
}
