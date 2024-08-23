import 'package:donate_blood/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class NearestView extends StatelessWidget {
  const NearestView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            Container(
              height: 45,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              // Background color for the entire TabBar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: TabBar(
                // controller: _tabController,
                tabs: const [
                  Tab(text: "View All"),
                  Tab(text: "See In Map"),
                ],
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 13,
                ),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: AppColor.redText,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
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
