import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  final bloodGroupList = [
    'A+',
    'B+',
    'AB+',
    'O+',
    'A-',
    'B-',
    'AB-',
    'O-',
  ];

  final features = [
    'View Donor List',
    'Sent Blood Request',
    'View Send Request',
    'Received Request',
    'Ready To Donate',
    'Hospital List'
  ];

  final selectedRequestIndex = 0.obs;
}