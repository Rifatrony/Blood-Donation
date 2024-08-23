import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final lastDonateController = TextEditingController();
  final totalLastDonateController = TextEditingController();
  final passwordController = TextEditingController();

  final age = 0.obs;

  final countryCode = "880".obs;

  final didHadLastDonate = false.obs;

  final isLoading = false.obs;

  final isVisible = true.obs;

  var selectedBloodGroup = Rxn<String>();

  void toggleLastDonate() {
    didHadLastDonate.value = !didHadLastDonate.value;
  }

  // NotificationServices notificationServices = NotificationServices();

  final List<String> bloodGroupList = [
    'A +',
    'B +',
    'AB +',
    'O +',
    'A -',
    'B -',
    'AB -',
    'O -',
  ];

  void setSelectedBloodGroup(String? value) {
    selectedBloodGroup.value = value;
  }


  var selectedDate = Rxn<DateTime>();

  void pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedDate.value = picked;
      lastDonateController.text = '${picked.toLocal()}'.split(' ')[0];
    }
  }

}