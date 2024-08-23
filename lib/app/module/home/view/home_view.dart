import 'package:donate_blood/app/module/home/controller/home_controller.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../.././widgets/button/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    var testImage2 = "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80";
    var testImage =
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80";
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 12,
            ),

            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(microseconds: 800),
                viewportFraction: 0.8,
                onPageChanged: (index, reason){
                  controller.selectedRequestIndex.value = index;
                }
              ),

              items: imgList
                  .map((item) => Card(
                        elevation: 2,
                        shadowColor: Colors.white70,
                        color: const Color(0xffEDEDE9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rifat Ahmed Rony",
                                          maxLines: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            text: "Looking For: ",
                                            children: [
                                              TextSpan(
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                                text: "A+",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "Location: whfwenvjd nbvhb m shbvns dmnb",
                                          maxLines: 2,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    onPress: () {},
                                    title: "Accept",
                                    backgroundColor:
                                        Colors.greenAccent.shade700,
                                  ),
                                  CustomButton(
                                    onPress: () {},
                                    title: "Delete",
                                    backgroundColor: AppColor.redText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(
              height: 10,
            ),

            Center(
              child: Obx(()=>
                AnimatedSmoothIndicator(
                  activeIndex: controller.selectedRequestIndex.value,
                  count: imgList.length,
                  effect: const SwapEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    type: SwapType.yRotation, // Applying yRotation effect
                  ),
                  onDotClicked: (index) {
                    // controller.animateToPage(index);
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 165,
              // color: Colors.red,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage(AppImage.bloodCellImage),
                          height: 90,
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 12,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Search Blood based on Blood Group",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 83,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: GridView.builder(
                        itemCount: controller.bloodGroupList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 10,
                          childAspectRatio: 9 / 4,
                        ),
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xffEDEDE9),
                              foregroundColor: Colors.black,
                              elevation: 4,
                              shadowColor: Colors.white70,
                            ),
                            child: Text(
                              controller.bloodGroupList[index].toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 230,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          image: AssetImage(AppImage.bloodCellImage),
                          height: 110,
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Features",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // GridView overlay
                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 83,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: GridView.builder(
                        itemCount: controller.features.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 12 / 7,
                        ),
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xffF1FAEE),
                              foregroundColor: Colors.black,
                              elevation: 4,
                              shadowColor: Colors.white70,
                            ),
                            child: Text(
                              controller.features[index].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
