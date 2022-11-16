import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/category_wise_property_model/category_wise_property_model.dart';
import 'package:lebech_property/buyer/models/home_screen_model/home_screen_model.dart';
import 'package:lebech_property/buyer/screens/property_details_screen/property_details_screen.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/category_property_screen_controller/category_property_screen_controller.dart';


/// Sub Category Module
class CPSSubCategoryTypeDropDownModule extends StatelessWidget {
  CPSSubCategoryTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryPropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => screenController.isLoading.value
        ? Container()
        : Container(
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
              child: DropdownButton<HomePropertyType>(
                value: screenController.subCategoryValue,
                items: screenController.subCategoryList
                    .map<DropdownMenuItem<HomePropertyType>>((HomePropertyType value) {
                  return DropdownMenuItem<HomePropertyType>(
                    value: value,
                    child: Text(
                      value.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.subCategoryValue = value!;
                  screenController.isLoading(false);
                  log("value : $value");
                  screenController.loadUI();
                  // await screenController.getCategoryWisePropertyFunction();
                },
              ),
            ),
          ),
        ),
    );
  }
}


/// Property Type Module
class CPSPropertyTypeDropDownModule extends StatelessWidget {
  CPSPropertyTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryPropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context)
            .size
            .width, //gives the width of the dropdown button
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
            child: DropdownButton<String>(
              value: screenController.propertyTypeValue.value,
              items: <String>[
                'Rent',
                'Sale',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) async {
                screenController.isLoading(true);
                screenController.propertyTypeValue.value = value!;
                screenController.isLoading(false);
                log("value : $value");
                // await screenController.getCategoryWisePropertyFunction();
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Find Button
class FindSubCategoryButtonModule extends StatelessWidget {
  FindSubCategoryButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryPropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await screenController.getCategoryWisePropertyFunction(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blueColor,
        ),
        child: const Text(
          "Find",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(horizontal: 30, vertical: 15),
      ),
    );
  }
}


/// Category List
class CategoryListTile extends StatelessWidget {
  final CategoryWiseDatum singleProperty;
  CategoryListTile({Key? key, required this.singleProperty}) : super(key: key);
  final screenController = Get.find<CategoryPropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> PropertyDetailsScreen(), arguments: singleProperty.id.toString());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 35,
              child: _imageModule(singleProperty),
            ),
            // const SizedBox(height: 5),
            Expanded(
              flex: 65,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _priceModule(singleProperty),
                      const SizedBox(height: 5),
                      _propertyHeadingModule(singleProperty),
                      const SizedBox(height: 5),
                      _smallDetailsModule(singleProperty),
                      const SizedBox(height: 5),
                      _placeModule(singleProperty),
                      const SizedBox(height: 5),
                      _parkingModule(singleProperty),
                      const SizedBox(height: 5),
                      _visitModule(),
                      const SizedBox(height: 5),
                      _propertyDetails(singleProperty),
                      const SizedBox(height: 5),
                      // const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageModule(CategoryWiseDatum singleProperty) {
    // String imgUrl = singleProperty.propertyImages[0].image;

    return Stack(
      children: [
        singleProperty.propertyImages.isEmpty
            ? Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
            ),
            image: DecorationImage(
              image: AssetImage(AppImages.banner1Img),
              fit: BoxFit.cover,
            ),
          ),
        )
            : Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
            ),
            image: DecorationImage(
              image: NetworkImage(singleProperty.propertyImages[0].image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "FOR ${singleProperty.detail.toUpperCase()}",
              style: const TextStyle(color: AppColors.blueColor),
            ).commonAllSidePadding(padding: 2),
          ),
        ),
      ],
    )

      /*Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          )
      ),
    )*/;
  }

  Widget _priceModule(CategoryWiseDatum singleProperty) {
    return Text(
      '₹ ${singleProperty.rent.rent}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: AppColors.greenColor, fontSize: 18),
    );
  }

  Widget _propertyHeadingModule(CategoryWiseDatum singleProperty) {
    return Text(
      singleProperty.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _smallDetailsModule(CategoryWiseDatum singleProperty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${singleProperty.bedrooms}BHK',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            '(₹ ${singleProperty.sqRate} per sqr.F)',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _placeModule(CategoryWiseDatum singleProperty) {
    return Text(
      '100% vastu (${singleProperty.area.name})',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _parkingModule(CategoryWiseDatum singleProperty) {
    return Text(
      '${singleProperty.propertyTenant.totalCarParking} Car Parking',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Widget _visitModule() {
    return const Text(
      'Book a Visit | Buy Owner Number',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }

  Widget _propertyDetails(CategoryWiseDatum singleProperty) {
    return Text(
      singleProperty.sortDesc,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

}