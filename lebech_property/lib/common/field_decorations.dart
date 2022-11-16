import 'package:flutter/material.dart';
import 'package:lebech_property/broker/controllers/broker_create_property_screen_controller/broker_create_property_screen_controller.dart';
import 'package:lebech_property/builder/controllers/builder_create_project_screen_controller/builder_create_project_screen_controller.dart';
import 'package:lebech_property/builder/controllers/builder_create_property_screen_controller/builder_create_property_screen_controller.dart';
import 'package:lebech_property/buyer/controllers/direct_search_screen_controller/direct_search_screen_controller.dart';
import 'package:lebech_property/buyer/controllers/search_screen_controller/search_screen_controller.dart';
import 'package:lebech_property/buyer/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:lebech_property/buyer/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/seller/controllers/seller_create_property_screen_controller/seller_create_property_screen_controller.dart';
import 'common_functions.dart';

InputDecoration searchFieldDecoration(
    {required String hintText,
    required SearchScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    prefixIcon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
  );
}

InputDecoration directSearchFieldDecoration(
    {required String hintText,
    required DirectSearchScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: IconButton(
      onPressed: () async {
        String searchText =
            screenController.directSearchFieldController.text.trim();
        await screenController.directSearchFunction(searchText: searchText);
        hideKeyBoard();
      },
      icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    ),
  );
}

InputDecoration signInFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required SignInScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    errorStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: index == 1
        ? GestureDetector(
            onTap: () {
              controller.isPasswordShow.value =
                  !controller.isPasswordShow.value;
            },
            child: Icon(
              controller.isPasswordShow.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.greenColor,
              size: 22,
            ),
          )
        : null,
  );
}

InputDecoration signUpFormFieldDecoration(
    {required String hintText,
    int index = 0,
    required SignUpScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    errorStyle: const TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    suffixIcon: index == 1
        ? GestureDetector(
            onTap: () {
              controller.isPasswordShow.value =
                  !controller.isPasswordShow.value;
            },
            child: Icon(
              controller.isPasswordShow.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.greenColor,
              size: 22,
            ),
          )
        : index == 2
            ? GestureDetector(
                onTap: () {
                  controller.isCPasswordShow.value =
                      !controller.isCPasswordShow.value;
                },
                child: Icon(
                  controller.isCPasswordShow.value
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: AppColors.greenColor,
                  size: 22,
                ),
              )
            : null,
  );
}

InputDecoration sellerCreatePropertyFieldDecoration(
    {required String hintText,
      required SellerCreatePropertyScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    // suffixIcon: IconButton(
    //   onPressed: () async {
    //     String searchText =
    //     screenController.directSearchFieldController.text.trim();
    //     await screenController.directSearchFunction(searchText: searchText);
    //     hideKeyBoard();
    //   },
    //   icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    // ),
  );
}


InputDecoration builderCreatePropertyFieldDecoration(
    {required String hintText,
      required BuilderCreatePropertyScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    // suffixIcon: IconButton(
    //   onPressed: () async {
    //     String searchText =
    //     screenController.directSearchFieldController.text.trim();
    //     await screenController.directSearchFunction(searchText: searchText);
    //     hideKeyBoard();
    //   },
    //   icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    // ),
  );
}


InputDecoration brokerCreatePropertyFieldDecoration(
    {required String hintText,
      required BrokerCreatePropertyScreenController screenController}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    // suffixIcon: IconButton(
    //   onPressed: () async {
    //     String searchText =
    //     screenController.directSearchFieldController.text.trim();
    //     await screenController.directSearchFunction(searchText: searchText);
    //     hideKeyBoard();
    //   },
    //   icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    // ),
  );
}

InputDecoration builderCreateProjectFieldDecoration(
    {required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    // suffixIcon: IconButton(
    //   onPressed: () async {
    //     String searchText =
    //     screenController.directSearchFieldController.text.trim();
    //     await screenController.directSearchFunction(searchText: searchText);
    //     hideKeyBoard();
    //   },
    //   icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    // ),
  );
}

InputDecoration commonFieldDecoration({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    counterText: '',
    // suffixIcon: IconButton(
    //   onPressed: () async {
    //     String searchText =
    //     screenController.directSearchFieldController.text.trim();
    //     await screenController.directSearchFunction(searchText: searchText);
    //     hideKeyBoard();
    //   },
    //   icon: const Icon(Icons.search, size: 25, color: AppColors.greenColor),
    // ),
  );
}