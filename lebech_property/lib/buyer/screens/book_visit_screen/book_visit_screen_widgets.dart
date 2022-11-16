import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/book_visit_screen_model/book_visit_details_model.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/book_visit_screen_controller/book_visit_screen_controller.dart';


/// Property Details Module
class BookVisitPropertyDetailsModule extends StatelessWidget {
  BookVisitPropertyDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookVisitScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Expanded(
            // flex: 45,
            child: _imagesListModule(),
          ),
          _propertyDetailsModule(),
          /*Expanded(
            flex: 55,
            child: _propertyDetailsModule(),
          ),*/
        ],
      ),
    );
  }

  Widget _imagesListModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
        ),
        image: DecorationImage(
          image: NetworkImage(screenController.propertyDetails.propertyImages![0].image.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _propertyDetailsModule() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            screenController.propertyDetails.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${screenController.propertyDetails.rent!.rent}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.greenColor,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            screenController.propertyDetails.sortDesc!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 3),
          Text(
            '${screenController.propertyDetails.bedrooms}BHK',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '${screenController.propertyDetails.propertyTenant!.totalCarParking} Car Parking',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

}

/// Branch DD
class BranchDropdownModule extends StatelessWidget {
  BranchDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookVisitScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        width: Get.width, //gives the width of the dropdown button
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown: true,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Branch>(
              value: screenController.branchValue,
              items: screenController.branchList
                  .map<DropdownMenuItem<Branch>>((Branch value) {
                return DropdownMenuItem<Branch>(
                  value: value,
                  child: Text(
                    value.title!,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                screenController.isLoading(true);
                screenController.branchValue = value!;
                screenController.isLoading(false);
                log("value : $value");
                screenController.loadUI();
                // await screenController.getCategoryWisePropertyFunction();
              },
            ),
          ),
        ),
      );
  }
}

/// Time Slot DD
class TimeSlotDropdownModule extends StatelessWidget {
  TimeSlotDropdownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookVisitScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: Get.width, //gives the width of the dropdown button
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown: true,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Time>(
            value: screenController.timeSlotValue,
            items: screenController.timeSlotList
                .map<DropdownMenuItem<Time>>((Time value) {
              return DropdownMenuItem<Time>(
                value: value,
                child: Text(
                  value.slot!,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              screenController.isLoading(true);
              screenController.timeSlotValue = value!;
              screenController.isLoading(false);
              log("value : $value");
              screenController.loadUI();
              // await screenController.getCategoryWisePropertyFunction();
            },
          ),
        ),
      ),
    );
  }
}

/// Book Button
class BookButtonModule extends StatelessWidget {
  BookButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookVisitScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.branchValue.title == "Search near by branch") {
          Fluttertoast.showToast(msg: "Please select branch!");
        } else if(screenController.timeSlotValue.slot == "Select time slot") {
          Fluttertoast.showToast(msg: "Please select time!");
        } else {
          await screenController.bookVisitFunction();

        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blueColor,
        ),
        child: const Text(
          "Book",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 24, vertical: 14),
      ),
    );
  }
}

