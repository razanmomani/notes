import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/login/controller_login.dart';
import 'package:my_notes/regester/regester_screen.dart';
import 'package:my_notes/tranislation/controller.dart';
import 'package:my_notes/utils/ui/commn_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  MyController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: Colors.grey.shade200,
                    ),
                    child: Image.asset('assets/images/notes.png', height: 60),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '4'.tr,
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '5'.tr,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CommnViews().createTextFormFiled(
                  controller: controller.emailController,
                  focusNode: controller.emailFocus,
                  label: '6'.tr,
                  isDarkTheme: false,
                  prefixIcon: Icon(Icons.email),
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(
                  () => CommnViews().createTextFormFiled(
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocus,
                    isObscuer: controller.isPasswordObscure.value,
                    prefixIcon: Icon(Icons.password),
                    label: '7'.tr,
                    isDarkTheme: false,
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
                  height: 10,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    '8'.tr,
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CommnViews().createButton(
              title: '4'.tr,
              onPressed: () {
                controller.login(
                  controller.emailController.text,
                  controller.passwordController.text,
                );
                //  Get.toNamed('HomePage');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CommnViews().createButton(
              title: '9'.tr,
              image: 'assets/images/google.png',
              onPressed: () async {
                //   controller.signInWithGoogle();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '10'.tr,
                  style: TextStyle(
                    /*  color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,*/
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.off(() => RegesterScreen());
                    //  Get.offNamed('RegesterScreen');
                  },
                  child: Text(
                    '11'.tr,
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
