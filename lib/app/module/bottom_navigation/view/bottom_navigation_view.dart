import 'dart:io';

import 'package:donate_blood/app/module/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:donate_blood/app/module/dashboard/view/dashboard_view.dart';
import 'package:donate_blood/app/module/home/view/home_view.dart';
import 'package:donate_blood/app/route/routes.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../request/view/request_view.dart';
import '../../profile/view//profile_view.dart';
import '../../Nearest/view/nearest_view.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());

    Future<bool> onBackPressed() async {
      if (controller.selectedIndex.value != 0) {
        // If the home page is not selected, select it
        controller.updateSelectedIndex(0);
        return false; // Do not exit the app
      } else {
        exitDialog();
        return true;
      }
    }

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: false,
          backgroundColor: AppColor.appBarColor,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.gps_fixed_rounded,
                    color: Colors.white70,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Mazukhan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.createPostRoute);
              },
              child: Container(
                // margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white24,
                ),
                child: Row(
                  children: [
                    Text(
                      "Create Post",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.add_rounded,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Obx(() => controller.selectedIndex.value == 0
            ? const DashboardView()
            : controller.selectedIndex.value == 1
                ? RequestView()
                : controller.selectedIndex.value == 2
                    ? NearestView()
                    : ProfileView()),
        bottomNavigationBar: Obx(
          () => Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.backgroundColor,
            ),
            // color: Colors.red,
            child: BottomNavigationBar(
              backgroundColor: AppColor.backgroundColor,
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: AppColor.redText,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: controller.updateSelectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.business,
                  ),
                  label: 'My Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on,
                  ),
                  label: 'Nearest',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> exitDialog() {
  return Get.defaultDialog(
    title: "Exit!!!",
    titleStyle: GoogleFonts.poppins(),
    titlePadding: const EdgeInsets.only(top: 16),
    backgroundColor: Colors.white,
    barrierDismissible: false,
    content: Column(
      children: [
        Text(
          "Are you sure you want to exit the App?",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(

          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                Get.back();
                exit(0);
              },
              child: Container(
                // height: 40.h,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.redColor,
                ),
                child: Center(
                  child: Text(
                    "YES",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Get.back();
              },
              child: Container(
                // height: 40.h,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "NO",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 8,
    ),
  );
}
