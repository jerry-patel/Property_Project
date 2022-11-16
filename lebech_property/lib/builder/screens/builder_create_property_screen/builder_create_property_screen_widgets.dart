import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_create_property_screen_controller/builder_create_property_screen_controller.dart';
import 'package:lebech_property/builder/controllers/builder_home_screen_controller/builder_home_screen_controller.dart';
import 'package:lebech_property/builder/screens/builder_create_property_screen/builder_pg_module.dart';
import 'package:lebech_property/builder/screens/builder_create_property_screen/builder_rent_module.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'builder_sell_module.dart';


class BCPPropertyDetailsModule extends StatelessWidget {
  BCPPropertyDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Property Detail",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.shade600),
          const Header1(text: "Property Details"),
          const Header2(text: "Property For"),
          PropertyForDropdownModule(),

          // If Sale Part Select then show this modules
          Obx(
                () => screenController.propertyForValue.value == screenController.propertyForList[0]
                ? BuilderSalePropertyDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                ? BuilderRentPropertyDetailsModule()
                : BuilderPgPropertyDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}

class BCPTenantDetailsModule extends StatelessWidget {
  BCPTenantDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
                ()=> screenController.isLoading.value
                ? Container()
                : Text(
              screenController.propertyForValue.value == screenController.propertyForList[0]
                  ? "Other Detail" : "Tenant Detail",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.shade600),

          // If Sale Part Select then show this modules
          Obx(
                () => screenController.propertyForValue.value == screenController.propertyForList[0]
                ? BuilderSaleTenantDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                ? BuilderRentTenantDetailsModule()
                : BuilderPgTenantDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}

class BCPOwnerDetailsModule extends StatelessWidget {
  BCPOwnerDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Owner Detail",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.shade600),

          // If Sale Part Select then show this modules
          Obx(
                () => screenController.propertyForValue.value == screenController.propertyForList[0]
                ? BuilderSaleOwnerDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                ? BuilderRentOwnerDetailsModule()
                : BuilderPgOwnerDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}


class PropertyForDropdownModule extends StatelessWidget {
  PropertyForDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: Get.width, //gives the width of the dropdown button
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown: true,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: screenController.propertyForValue.value,
            items: screenController.propertyForList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              screenController.isLoading(true);
              screenController.propertyForValue.value = value!;
              screenController.isLoading(false);
            },
          ),
        ),
      ),
    );
  }
}


class BuilderSaveButtonModule extends StatelessWidget {
  BuilderSaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreatePropertyScreenController>();
  final sellerHomeScreenController = Get.find<BuilderHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.formKey.currentState!.validate()) {
          await onCLickFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blueColor,
        ),
        child: const Text(
          "Save",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 25, vertical: 15),
      ),
    );
  }


  Future<void> onCLickFunction() async {
    if(screenController.cityValue.name == "Select City") {
      Fluttertoast.showToast(msg: "Please select city!");
    } else if(screenController.areaValue.name == "Select Area") {
      Fluttertoast.showToast(msg: "Please select area!");
    } else if(screenController.propertyNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill property name field!");
    } else if(screenController.availabilityOfWaterValue == "") {
      Fluttertoast.showToast(msg: "Please select availability of water value!");
    } else if(screenController.availabilityOfElectricityValue == "") {
      Fluttertoast.showToast(msg: "Please select status of electricity value!");
    } else if(screenController.isTermAndCondition.value == false) {
      Fluttertoast.showToast(msg: "Please agree with terms & condition!");
    } else {
      await screenController.createPropertyFunction();
      // await sellerHomeScreenController.getSellerAllPropertyFunction();
    }
  }

}