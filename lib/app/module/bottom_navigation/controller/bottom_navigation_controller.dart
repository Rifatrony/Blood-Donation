import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final selectedTabIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  var sidebarItemList = [
    'Home',
    'Request',
    'Donor',
    'Map View'
  ];


}