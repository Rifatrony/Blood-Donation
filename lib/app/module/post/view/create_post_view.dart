import 'package:donate_blood/app/module/dashboard/view/widget/description_widget.dart';
import 'package:donate_blood/app/module/post/controller/post_controller.dart';
import 'package:donate_blood/app/utils/app_color.dart';
import 'package:donate_blood/app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:donate_blood/app/widgets/form/custom_text_form.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        foregroundColor: Colors.white,
        title: Text(
          "Create Post",
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Obx(
            () => Visibility(
              visible: controller.patientName.value.isNotEmpty,
              child: Container(
                // height: 200,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    if (controller.patientName.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Patient Name: ",
                        value: controller.patientName.value.trim(),
                      ),
                    if (controller.age.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Age: ",
                        value: controller.age.value,
                      ),
                    if (controller.patientNumber.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Patient Number: ",
                        value: controller.patientNumber.value,
                      ),
                    if (controller.patientProblem.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Patient Problem: ",
                        value: controller.patientProblem.value,
                      ),
                    if (controller.date.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Donate Date: ",
                        value: controller.date.value.trim(),
                      ),
                    if (controller.time.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Donate Time: ",
                        value: controller.time.value,
                      ),
                    if (controller.bloodAmount.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Blood Amount: ",
                        value: controller.bloodAmount.value,
                      ),
                    if (controller.location.value.isNotEmpty)
                      DescriptionWidget(
                        title: "Location: ",
                        value: controller.location.value,
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  "Fill Up Patient Information",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.redText,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  controller: controller.patientNameController,
                  hintText: "Patient Name",
                  isPrefix: true,
                  prefixIcon: Icons.person_outline_rounded,
                  currentFocusNode: controller.patientNameFocusNode,
                  nextFocusNode: controller.ageFocusNode,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextForm(
                        controller: controller.ageController,
                        currentFocusNode: controller.ageFocusNode,
                        nextFocusNode: controller.bloodAmountFocusNode,
                        hintText: "Patient age",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextForm(
                        controller: controller.bloodAmountController,
                        currentFocusNode: controller.bloodAmountFocusNode,
                        nextFocusNode: controller.patientNumberFocusNode,
                        hintText: "Blood Amount(1 Bag..)",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  controller: controller.patientNumberController,
                  focusNode: controller.patientNumberFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: 'Phone Number',
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    print("Complete Number is ${phone.completeNumber}");
                  },
                  onCountryChanged: (country) {
                    controller.countryCode.value = country.fullCountryCode;
                    print('Country Code from Controller to: ' +
                        controller.countryCode.value);
                  },
                  onSubmitted: (_){
                    controller.patientNumberFocusNode.unfocus();
                    controller.patientProblemFocusNode.requestFocus();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextForm(
                  controller: controller.patientProblemController,
                  currentFocusNode: controller.patientProblemFocusNode,
                  nextFocusNode: controller.dateFocusNode,
                  hintText: "Patient Problem",
                  prefixIcon: Icons.phone,
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextForm(
                        controller: controller.dateController,
                        currentFocusNode: controller.dateFocusNode,
                        nextFocusNode: controller.timeFocusNode,
                        hintText: "Date",
                        isSuffix: true,
                        isReadOnly: true,
                        suffixIcon: Icons.calendar_month,
                        onPressSuffix: () {
                          controller.pickDate(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextForm(
                        controller: controller.timeController,
                        currentFocusNode: controller.timeFocusNode,
                        nextFocusNode: controller.locationFocusNode,
                        hintText: "Time",
                        isSuffix: true,
                        isReadOnly: true,
                        suffixIcon: Icons.watch_later_outlined,
                        onPressSuffix: () {
                          controller.pickTime(context);
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextForm(
                        currentFocusNode: controller.locationFocusNode,
                        nextFocusNode: controller.referenceFocusNode,
                        controller: controller.locationController,
                        hintText: "Location",
                        prefixIcon: Icons.phone,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextForm(
                        currentFocusNode: controller.referenceFocusNode,
                        controller: controller.referenceController,
                        hintText: "Reference (Optional)",
                        prefixIcon: Icons.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // CustomTextForm(
                //   controller: controller.commentsController,
                //   hintText: "Comments (Optional)",
                //   prefixIcon: Icons.phone,
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        // color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5,),
        child: CustomButton(
          onPress: () {
            Get.back();
          },
          title: "Post",
          backgroundColor: AppColor.appBarColor,
        ),
      ),
    );
  }
}
