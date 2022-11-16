import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/sub_category_wise_property_screen_controller/sub_category_wise_property_screen_controller.dart';
import '../../models/sub_category_wise_property_model/sub_category_wise_property_model.dart';


class SCWPPropertyTypeDropDownModule extends StatelessWidget {
  SCWPPropertyTypeDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubCategoryWisePropertyScreenController>();

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
                'Sell',
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
                screenController.subCategoryWisePropertyFunction();
              },
            ),
          ),
        ),
      ),
    );
  }
}


class SubCategoryListTile extends StatelessWidget {
  final Datum singleItem;
  SubCategoryListTile({Key? key, required this.singleItem}) : super(key: key);

  final screenController = Get.find<SubCategoryWisePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    String imgUrl = singleItem.propertyImages[0].image;
    return GestureDetector(
      onTap: () {},
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
              child: _imageModule(imgUrl),
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
                      _priceModule(singleItem),
                      const SizedBox(height: 5),
                      _propertyHeadingModule(singleItem),
                      const SizedBox(height: 5),
                      _smallDetailsModule(singleItem),
                      const SizedBox(height: 5),
                      _placeModule(singleItem),
                      const SizedBox(height: 5),
                      _parkingModule(singleItem),
                      const SizedBox(height: 5),
                      _visitModule(),
                      const SizedBox(height: 5),
                      _propertyDetails(singleItem),
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

  Widget _imageModule(String imgUrl) {
    return Container(
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
    );
  }

  Widget _priceModule(Datum singleItem) {
    return Text(
      '₹ ${singleItem.rent.rent}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    );
  }

  Widget _propertyHeadingModule(Datum singleItem) {
    return Text(
      singleItem.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _smallDetailsModule(Datum singleItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${singleItem.bedrooms}BHK',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '(₹ ${singleItem.sqRate} per sqr.F)',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }

  Widget _placeModule(Datum singleItem) {
    return Text(
      '100% vastu (${singleItem.area.name})',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _parkingModule(Datum singleItem) {
    return Text(
      '${singleItem.propertyTenant.totalCarParking} Car Parking',
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

  Widget _propertyDetails(Datum singleItem) {
    return Text(
      singleItem.sortDesc,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

}