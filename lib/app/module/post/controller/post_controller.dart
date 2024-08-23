import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PostController extends GetxController {

  final countryCode = "880".obs;

  final patientNameController = TextEditingController();
  final patientNumberController = TextEditingController();
  final patientProblemController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final ageController = TextEditingController();
  final bloodAmountController = TextEditingController();
  final locationController = TextEditingController();
  final referenceController = TextEditingController();

  final patientNameFocusNode = FocusNode();
  final patientNumberFocusNode = FocusNode();
  final patientProblemFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final bloodAmountFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final referenceFocusNode = FocusNode();

  var selectedDate = Rxn<DateTime>();

  var patientName = "".obs;
  var patientNumber = "".obs;
  var patientProblem = "".obs;
  var date = "".obs;
  var time = "".obs;
  var age = "".obs;
  var bloodAmount = "".obs;
  var location = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    patientNameController.addListener(() {
      patientName.value = patientNameController.text;
    });

    ageController.addListener(() {
      age.value = ageController.text;
    });

    patientNumberController.addListener(() {
      patientNumber.value = patientNumberController.text;
    });

    patientProblemController.addListener(() {
      patientProblem.value = patientProblemController.text;
    });

    dateController.addListener(() {
      date.value = dateController.text;
    });

    timeController.addListener(() {
      time.value = timeController.text;
    });

    bloodAmountController.addListener(() {
      bloodAmount.value = bloodAmountController.text;
    });

    locationController.addListener(() {
      location.value = locationController.text;
    });

  }

  void pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      selectedDate.value = picked;
      dateController.text = '${picked.toLocal()}'.split(' ')[0];
    }
  }


  var selectedTime = Rxn<TimeOfDay>();

  void pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      timeController.text = pickedTime.format(context);  // Set the time in the TextEditingController
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    patientNameController.dispose();
    patientNumberController.dispose();
    patientProblemController.dispose();
    ageController.dispose();
    locationController.dispose();
    referenceController.dispose();
    dateController.dispose();
    timeController.dispose();
    bloodAmountController.dispose();
  }
}