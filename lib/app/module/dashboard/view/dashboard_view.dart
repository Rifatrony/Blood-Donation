import 'dart:developer';

import 'package:donate_blood/app/route/routes.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/utils/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:donate_blood/app/module/dashboard/view/widget/description_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            width: 1,
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    // log("Click");
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColor.backgroundColor,
                      builder: (context) => Container(
                        height: 200,

                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    child: const Icon(
                      Icons.swap_horiz_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  margin: const EdgeInsets.only(
                    bottom: 15,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "User Name",
                              ),
                              Text(
                                "Request Sent: 2 min ago",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DescriptionWidget(
                        title: "Patient Name: ",
                        value: "Rjd c,nsd",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone Number: ",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.5),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "55484512122",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.5,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.phone,
                                    size: 15,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const DescriptionWidget(
                        title: "Age: ",
                        value: "40",
                      ),
                      const DescriptionWidget(
                        title: "Blood Amount: ",
                        value: "1 Bag",
                        valueFontWeight: FontWeight.w500,
                        // textDecoration: TextDecoration.underline,
                        isBorder: true,
                      ),
                      const DescriptionWidget(
                        title: "Patient Problem: ",
                        value: "Dialysis",
                      ),
                      const DescriptionWidget(
                        title: "Date: ",
                        value: "5/10/2024",
                      ),
                      const DescriptionWidget(
                        title: "Time: ",
                        value: "10:50 AM",
                      ),
                      const DescriptionWidget(
                        title: "Location: ",
                        value: "Hospital Name",
                      ),

                      const SizedBox(height: 2,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status: ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal, fontSize: 11.5),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3,),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Pending",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal, fontSize: 10.5, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: AssetImage(
                            AppImage.bloodCellImage,
                          ),
                          height: 120,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteName.createPostRoute);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffEDEDE8),
        // elevation: 5,
        tooltip: "Create new post",
        child: const Icon(
          Icons.add_rounded,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
