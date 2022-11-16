import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/direct_search_model/direct_search_model.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/app_images.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import '../../controllers/direct_search_screen_controller/direct_search_screen_controller.dart';
import '../property_details_screen/property_details_screen.dart';


class DSSPropertyTypeDropDownModule extends StatelessWidget {
  DSSPropertyTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<DirectSearchScreenController>();

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
              onChanged: (value) {
                screenController.isLoading(true);
                screenController.propertyTypeValue.value = value!;
                screenController.isLoading(false);
                log("value : $value");
              },
            ),
          ),
        ),
      ),
    );
  }
}



class DirectSearchScreenSearchFieldModule extends StatelessWidget {
  DirectSearchScreenSearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<DirectSearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.directSearchFieldController,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.greenColor,
      decoration: directSearchFieldDecoration(hintText: 'Search Property', screenController: screenController),
    );
  }
}

class DirectSearchListModule extends StatelessWidget {
  DirectSearchListModule({Key? key}) : super(key: key);
  final screenController = Get.find<DirectSearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.directSearchList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i){
        DirectSearchDatum singleListingsItem = screenController.directSearchList[i];
        return GestureDetector(
          onTap: ()=> Get.to(()=> PropertyDetailsScreen(),
            transition: Transition.zoom,
            arguments: singleListingsItem.id.toString(),),

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 45,
                  child: _imagesListModule(singleListingsItem: singleListingsItem),
                ),
                Expanded(
                  flex: 55,
                  child: _propertyDetailsModule(singleListingsItem: singleListingsItem),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imagesListModule({required DirectSearchDatum singleListingsItem}) {
    return Stack(
      children: [
        singleListingsItem.propertyImages.isEmpty
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
              image: NetworkImage(singleListingsItem.propertyImages[0].image),
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
              "FOR ${singleListingsItem.detail.toUpperCase()}",
              style: const TextStyle(color: AppColors.blueColor),
            ).commonAllSidePadding(padding: 2),
          ),
        ),
      ],
    );
  }

  Widget _propertyDetailsModule({required DirectSearchDatum singleListingsItem}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleListingsItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "₹ ${singleListingsItem.rent.rent}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            singleListingsItem.sortDesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 3),
          singleListingsItem.bedrooms == "0"
              ? Container()
              : Text(
            '${singleListingsItem.bedrooms}BHK',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          singleListingsItem.propertyTenant.totalCarParking == 0
              ? Container()
              : Text(
            '${singleListingsItem.propertyTenant.totalCarParking} Car Parking',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

}