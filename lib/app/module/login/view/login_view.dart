import 'package:donate_blood/app/route/routes.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/widgets/button/custom_button.dart';
import 'package:donate_blood/app/widgets/form/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:donate_blood/app/module/login/controller/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: AppColor.backgroundColor,
      //   automaticallyImplyLeading: false,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
              ),
              Text("Login"),
              SizedBox(
                height: 20,
              ),
              // CustomTextForm(
              //   controller: controller.emailController,
              //   hintText: "email".tr,
              //   isPrefix: true,
              //   prefixIcon: Icons.email,
              // ),
              TextFormField(
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.email_rounded),
                  // suffixIcon: Icon(Icons.visibility),
                ),
                onFieldSubmitted: (_) {
                  controller.emailFocusNode.unfocus();
                  controller.passwordFocusNode.requestFocus();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isVisible.value,
                  focusNode: controller.passwordFocusNode,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isVisible.value =
                            !controller.isVisible.value;
                      },
                      child: Icon(
                        controller.isVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              // Obx(
              //   () => CustomTextForm(
              //     isVisible: controller.isVisible.value,
              //     controller: controller.passwordController,
              //     hintText: "Password",
              //     prefixIcon: Icons.lock,
              //     isPrefix: true,
              //     isSuffix: true,
              //     suffixIcon: controller.isVisible.value
              //         ? Icons.visibility
              //         : Icons.visibility_off,
              //     onPressSuffix: () {
              //       controller.isVisible.value = !controller.isVisible.value;
              //     },
              //   ),
              // ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleRememberMe();
                    },
                    child: Text(
                      "Remember Me",
                    ),
                  ),
                  Obx(
                    () => Checkbox(
                      value: controller.isRemembered.value,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        controller.toggleRememberMe();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 45,
                // color: Colors.blue,
                child: ElevatedButton(
                  onPressed: () {
                    controller.checkValidation();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.redColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: GoogleFonts.poppins(),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Account yet?",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.signupRoute);
                    },
                    child: Text(
                      "Sign Up.",
                      style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      // fontColor: greenText,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Fluttertoast.showToast(
                  //     msg: "This is Center Short Toast",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     fontSize: 16.0);
                  // customLoading();
                },
                child: Text(
                  "Forget Password???",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  // fontColor: red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
