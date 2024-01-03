import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/login/login_screen.dart';
import 'package:my_notes/regester/controller_regester.dart';
import 'package:my_notes/regester/model.dart';
import 'package:my_notes/tranislation/controller.dart';
import 'package:my_notes/utils/ui/commn_view.dart';

class RegesterScreen extends StatelessWidget {
  RegesterScreen({Key? key}) : super(key: key);
  final RegesterController controller = Get.put(RegesterController());
  MyController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: ListView(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        'assets/images/notes.png',
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '12'.tr,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '13'.tr,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommnViews().createTextFormFiled(
                    controller: controller.userNameController,
                    focusNode: controller.userNameFocus,
                    label: '14'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommnViews().createTextFormFiled(
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    label: '6'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CommnViews().createTextFormFiled(
                      controller: controller.passController,
                      focusNode: controller.passFocus,
                      label: '7'.tr,
                      isObscuer: controller.isPasswordObscure.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.togglePasswordVisibility();
                        },
                        child: Icon(
                          controller.isPasswordObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            CommnViews().createButton(
                title: '15'.tr,
                backgroundColor: Colors.orange,
                onPressed: () async {
                  UserModel model = UserModel(
                    email: controller.emailController.text,
                    fullName: controller.userNameController.text,
                    password: controller.passController.text,
                  );
                  controller.createRegistrationWithSignUp(model);
                  // Get.offNamed('LoginScreen');
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '16' .tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.back();
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text(
                    '4'.tr,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
