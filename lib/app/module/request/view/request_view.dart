import 'package:donate_blood/app/module/dashboard/view/widget/description_widget.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            const SizedBox(height: 8,),
            Container(
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              // Background color for the entire TabBar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade200,
              ),
              child: TabBar(
                // controller: _tabController,
                tabs: const [
                  Tab(text: "Today"),
                  Tab(text: "Last 7 Days"),
                  Tab(text: "All"),
                ],
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 13,
                ),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: AppColor.redText,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 2,
                    padding: EdgeInsets.only(bottom: 15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        margin: const EdgeInsets.only(
                            // bottom: 15,
                            left: 10,
                            right: 10,
                            top: 15),
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    // Handle menu item selection
                                    print('Selected: $value');
                                  },
                                  color: AppColor.backgroundColor,
                                  elevation: 5,
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: 'option1',
                                      child: CustomPopupMenuItem(
                                        icon: Icons.edit_outlined,
                                        text: 'Edit',
                                      ),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'option3',
                                      child: CustomPopupMenuItem(
                                        icon: Icons.delete_outline,
                                        text: 'Delete',
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 1.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              title: "Post Date: ",
                              value: "5/10/2024",
                            ),
                            const DescriptionWidget(
                              title: "Post Time: ",
                              value: "10:50 AM",
                            ),
                            const DescriptionWidget(
                              title: "Location: ",
                              value: "Hospital Name",
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status: ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11.5,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "Pending",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10.5,
                                        color: Colors.white),
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
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPopupMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomPopupMenuItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 20),
          SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
