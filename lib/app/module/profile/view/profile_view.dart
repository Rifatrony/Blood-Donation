import 'package:donate_blood/app/module/profile/controller/profile_controller.dart';
import 'package:donate_blood/app/route/routes.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../controller/profile_controller.dart';

import './widget/profile_item_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 8,
            ),
            CircleAvatar(
              radius: 60,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Rifat Ahmed Rony",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Center(
              child: Text(
                "Email: ",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Center(
              child: Text(
                "Last Donate: ",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 5,
                  shadowColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      // height: 40,
                      // width: 40,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColor.redColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.home,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "I want to Donate",
                      ),
                    ),
                    Theme(
                      data: ThemeData(useMaterial3: false),
                      child: Obx(
                        () => Switch(
                          value: controller.isSwitchOn.value,
                          onChanged: (value) {
                            controller.isSwitchOn.value = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProfileItemWidget(
              onPress: () {},
              title: 'Edit Profile',
              icon: Icons.edit_rounded,
            ),
            ProfileItemWidget(
              onPress: () {},
              title: 'Blood Request',
              icon: Icons.bloodtype_outlined,
            ),
            ProfileItemWidget(
              onPress: () {},
              title: 'Settings',
              icon: Icons.settings_outlined,
            ),
            ProfileItemWidget(
              onPress: () {},
              title: 'Privacy & Policy',
              icon: Icons.privacy_tip_outlined,
            ),
            ProfileItemWidget(
              onPress: () {},
              title: 'About Us',
              icon: Icons.info_outline,
            ),
            ProfileItemWidget(
              onPress: () {
                Get.defaultDialog(
                    backgroundColor: AppColor.backgroundColor,
                    title: "Logout",
                    titleStyle: GoogleFonts.poppins(),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    content: Column(
                      children: [
                        Text(
                          "Are you sure, You want to logout?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(

                          ),
                        ),

                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPress: () {
                                  Get.offAllNamed(RouteName.loginRoute);
                                  Get.back();
                                },
                                title: "YES",
                                backgroundColor: AppColor.redColor,
                              ),
                            ),

                            const SizedBox(width: 15,),

                            Expanded(
                              child: CustomButton(
                                onPress: () {
                                  Get.back();
                                },
                                title: "NO",
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
                // Get.toNamed(RouteName.loginRoute);
              },
              title: 'Logout',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
