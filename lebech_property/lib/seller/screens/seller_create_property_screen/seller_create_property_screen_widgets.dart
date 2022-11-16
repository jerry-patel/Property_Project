import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_create_property_screen_controller/seller_create_property_screen_controller.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';

import 'pg_module.dart';
import 'rent_module.dart';
import 'sale_module.dart';

class SCPPropertyDetailsModule extends StatelessWidget {
  SCPPropertyDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

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
                ? SalePropertyDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                    ? RentPropertyDetailsModule()
                    : PgPropertyDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}


class SCPTenantDetailsModule extends StatelessWidget {
  SCPTenantDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

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
                ? SaleTenantDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                ? RentTenantDetailsModule()
                : PgTenantDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}


class SCPOwnerDetailsModule extends StatelessWidget {
  SCPOwnerDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

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
                ? SaleOwnerDetailsModule()
                : screenController.propertyForValue.value == screenController.propertyForList[1]
                ? RentOwnerDetailsModule()
                : PgOwnerDetailsModule(),
          ),

        ],
      ).commonAllSidePadding(padding: 3),
    ).commonAllSidePadding(padding: 8);
  }
}


class PropertyForDropdownModule extends StatelessWidget {
  PropertyForDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

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


class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();
  final sellerHomeScreenController = Get.find<SellerHomeScreenController>();

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
      await sellerHomeScreenController.getSellerAllPropertyFunction();
    }
  }

}


