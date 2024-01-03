import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_notes/config/firebase_expation/firebase_erorr.dart';
import 'package:my_notes/login/login_screen.dart';
import 'package:my_notes/regester/model.dart';
import 'package:my_notes/utils/ui/commn_view.dart';
import 'package:my_notes/utils/ui/loading_screen.dart';

class RegesterController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode userNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  RxString emailError = ''.obs; // Corrected variable name
  RxString passwordError = ''.obs; // Corrected variable name
  RxBool isPasswordObscure = true.obs;

  // Signup email & password
  Future<void> createRegistrationWithSignUp(UserModel userModel) async {
    if (isValid(userModel.email, userModel.password ?? '')) {
      try {
        LoadingScreen.shared.startLoading(Get.context);
        var result = await auth.createUserWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password!,
        );
        /*    await FirebaseAuth.instance.currentUser!
            .sendEmailVerification();*/
        if (result.user != null) {
          userModel.uid = result.user!.uid;
          //       Get.offNamed('LoginScreen');
          Get.to(() => LoginScreen());
        } else {
          LoadingScreen.shared.stopeLoading(); // Corrected method name
          CommnViews().showSnackBar('41'.tr, '44'.tr); // Corrected method name
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (error) {
        LoadingScreen.shared.stopeLoading(); // Corrected method name
        if (error is FirebaseException) {
          CommnViews()
              .showSnackBar('41'.tr, FirebaseErrors.getMessage(error.code));
        } else {
          CommnViews().showSnackBar('41'.tr, '45 $error'.tr);
        }
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
  }

  bool isValid(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = '42'.tr;
      return false;
    } else if (password.isEmpty) {
      passwordError.value = '43'.tr;
      return false;
    } else if (password.length < 6) {
      passwordError.value = '46'.tr;
      return false;
    }
    return true;
  }

  // Obscure password &confirmPassword
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }
}
