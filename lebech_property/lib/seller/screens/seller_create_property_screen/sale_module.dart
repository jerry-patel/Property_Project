import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';
import 'package:lebech_property/seller/controllers/seller_create_property_screen_controller/seller_create_property_screen_controller.dart';
import '../../models/seller_create_property_screen_model/form_basic_details_model.dart';

class SalePropertyDetailsModule extends StatelessWidget {
  SalePropertyDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        propertyTypeDropDownModule(context),
        const SizedBox(height: 8),
        const Header1(text: "Property Location"),
        cityDropDownModule(context),
        areaDropDownModule(context),
        propertyNameFieldModule(),
        propertyShortDescriptionFieldModule(),
        const Divider(),
        const Header1(text: "Property Features"),
        screenController.propertyTypeValue.sub == "house"
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: bedRoomDropDownModule(context)),
                  const SizedBox(width: 8),
                  Expanded(child: withoutHallCheckbox()),
                ],
              )
            : Container(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenController.propertyTypeValue.sub == "house"
                ? Expanded(child: balconiesDropDownModule(context))
                : Container(),
            const SizedBox(width: 8),
            screenController.propertyTypeValue.sub == "house" ||
                    screenController.propertyTypeValue.sub == "office" ||
                    screenController.propertyTypeValue.sub == "textile"
                ? Expanded(child: floorNumberFieldModule())
                : Container(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenController.propertyTypeValue.sub == "house" ||
                    screenController.propertyTypeValue.sub == "office" ||
                    screenController.propertyTypeValue.sub == "textile"
                ? Expanded(child: totalFloorFieldModule())
                : Container(),
            const SizedBox(width: 8),
            screenController.propertyTypeValue.sub == "house" ||
                    screenController.propertyTypeValue.sub == "office" ||
                    screenController.propertyTypeValue.sub == "textile"
                ? Expanded(child: furnishedDropDownModule(context))
                : Container(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenController.propertyTypeValue.sub == "house" ||
                    screenController.propertyTypeValue.sub == "office" ||
                    screenController.propertyTypeValue.sub == "textile" ||
                    screenController.propertyTypeValue.sub == "shed"
                ? Expanded(child: bathroomsDropDownModule(context))
                : Container(),
            const SizedBox(width: 8),
            screenController.propertyTypeValue.sub == "house" ||
                    screenController.propertyTypeValue.sub == "office" ||
                    screenController.propertyTypeValue.sub == "textile"
                ? Expanded(child: acDropDownModule(context))
                : Container(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenController.propertyTypeValue.sub == "house"
                ? screenController.furnishedValue.value == "Furnished" || screenController.furnishedValue.value == "Semi_Furnished"
                ? Expanded(child: bedDropDownModule(context)) : Container()
                : Container(),
            const SizedBox(width: 8),
            screenController.propertyTypeValue.sub == "house"
                ? screenController.furnishedValue.value == "Furnished" || screenController.furnishedValue.value == "Semi_Furnished"
                ? Expanded(child: wardrobeDropDownModule(context)) : Container()
                : Container(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenController.propertyTypeValue.sub == "house"
                ? screenController.furnishedValue.value == "Furnished" || screenController.furnishedValue.value == "Semi_Furnished"
                ? Expanded(child: tvDropDownModule(context)) : Container()
                : Container(),
            const SizedBox(width: 8),
            Expanded(child: Container()),
          ],
        ),
        checkBoxGridViewModule(),
        const Divider(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile" ||
                screenController.propertyTypeValue.sub == "industrial" ||
                screenController.propertyTypeValue.sub == "shed" ||
            screenController.propertyTypeValue.sub == "plot"
            ? const Header1(text: "Area")
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile" ||
                screenController.propertyTypeValue.sub == "industrial" ||
                screenController.propertyTypeValue.sub == "shed"
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: superAreaFieldModule()),
                  const SizedBox(width: 8),
                  Expanded(child: carpetAreaFieldModule()),
                ],
              )
            :
        screenController.propertyTypeValue.sub == "plot"
            ? varVighaYardFieldModule()
        : Container(),
        screenController.propertyTypeValue.sub == "shed" ? heightFieldModule() : Container(),
        const Divider(),
        const Header1(text: "Transaction Type, Property Availability"),
        availableFromModule(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile" ||
                screenController.propertyTypeValue.sub == "industrial" ||
                screenController.propertyTypeValue.sub == "shed"
            ? ageOfConstructionDropDownModule(context)
            : Container(),
        const SizedBox(height: 8),
        screenController.propertyAvailability == PropertyAvailability.date
            ? datePickerModule(context)
            : Container(),
        const Divider(),
        const Header1(text: "Other Detail"),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? otherDetailsRadioButtonModule()
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: liftsInTowerFieldModule()),
                  const SizedBox(width: 8),
                  Expanded(child: unitsOnTheFloorFieldModule()),
                ],
              )
            : Container(),
        const Divider(),
        const Header1(text: "Sale Detail"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: salePriceFieldModule()),
            const SizedBox(width: 8),
            Expanded(child: negotiableCheckbox()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: loanAmountFieldModule()),
            const SizedBox(width: 8),
            Expanded(child: perSrFtRateFieldModule()),
          ],
        ),
      ],
    );
  }

  // Property Type Dropdown
  Widget propertyTypeDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Property Type"),
        Container(
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
              child: DropdownButton<Property>(
                value: screenController.propertyTypeValue,
                items: screenController.propertyTypeList
                    .map<DropdownMenuItem<Property>>((Property value) {
                  return DropdownMenuItem<Property>(
                    value: value,
                    child: Text(
                      value.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.propertyTypeValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Property Location Module
  // City Dropdown
  Widget cityDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "City"),
        Container(
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
              child: DropdownButton<BasicCity>(
                value: screenController.cityValue,
                items: screenController.cityList
                    .map<DropdownMenuItem<BasicCity>>((BasicCity value) {
                  return DropdownMenuItem<BasicCity>(
                    value: value,
                    child: Text(
                      value.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.cityValue = value!;

                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Area Dropdown
  Widget areaDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Area"),
        Container(
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
            child: DropdownSearch<String>(
              showSearchBox: true,
              mode: Mode.MENU,
              items: screenController.stringAreaList,
              key: screenController.areaDropDownProgKey,

              onChanged: (value) {
                screenController.isLoading(true);
                for (var element in screenController.areaList) {
                  if(element.name == value) {
                    screenController.areaValue = element;
                    log("${screenController.areaValue.name}");
                    log("${screenController.areaValue.id}");
                  }
                }
                screenController.isLoading(false);
              },
            ),
           /* child: DropdownButtonHideUnderline(
              child: DropdownButton<BasicArea>(
                value: screenController.areaValue,
                items: screenController.areaList
                    .map<DropdownMenuItem<BasicArea>>((BasicArea value) {
                  return DropdownMenuItem<BasicArea>(
                    value: value,
                    child: Text(
                      value.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.areaValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),*/
          ),
        ),
      ],
    );
  }

  // Property Name
  Widget propertyNameFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Property Name/Society"),

        TypeAheadField(
          suggestionsCallback: (text) async {
            return await screenController.getSearchNameListFunction(text);
          },
          hideSuggestionsOnKeyboardHide: true,
          textFieldConfiguration: TextFieldConfiguration(
            controller: screenController.propertyNameController,
            decoration: sellerCreatePropertyFieldDecoration(
                hintText: '', screenController: screenController),
          ),
          itemBuilder: (context, String? suggestion) {
            final cat = suggestion!;
            return ListTile(
              title: Text(cat),
            );
          },
          onSuggestionSelected: (String? suggestion) {
            screenController.propertyNameController.text = suggestion!;
            log("Text : ${screenController.propertyNameController.text}");
          },
        ),

        // TextFormField(
        //   controller: screenController.propertyNameController,
        //   keyboardType: TextInputType.text,
        //   decoration: sellerCreatePropertyFieldDecoration(hintText: '',screenController: screenController),
        //   validator: (value) => FieldValidations().validateFullName(value!),
        // ),
      ],
    );
  }

  // Property Sort Description
  Widget propertyShortDescriptionFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Property Sort Description"),
        TextFormField(
          controller: screenController.propertySortDescController,
          keyboardType: TextInputType.text,
          maxLines: 3,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          validator: (value) => FieldValidations().validateFullName(value!),
        ),
      ],
    );
  }

  // Bedroom DD
  Widget bedRoomDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Bedrooms"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.bedRoomValue,
                items: screenController.bedRoomList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.bedRoomValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Without Hall Checkbox
  Widget withoutHallCheckbox() {
    return Column(
      children: [
        const Header2(text: ""),
        Row(
          children: [
            Obx(
              () => Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.blueColor),
                value: screenController.isWithoutHall.value,
                onChanged: (bool? value) {
                  screenController.isWithoutHall.value =
                      !screenController.isWithoutHall.value;
                  log("screenController.isWithoutHall.value : ${screenController.isWithoutHall.value}");
                },
              ),
            ),
            const Text("Without Hall"),
          ],
        ),
      ],
    );
  }

  // Balconies DD
  Widget balconiesDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Balconies"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.balconiesValue,
                items: screenController.balconiesList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.balconiesValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Floor No
  Widget floorNumberFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Floor No."),
        TextFormField(
          controller: screenController.floorNoController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Total Floor
  Widget totalFloorFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Total Floor"),
        TextFormField(
          controller: screenController.totalFloorController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Furnished Dropdown
  Widget furnishedDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Furnished Status"),
        Container(
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
                value: screenController.furnishedValue.value,
                items: screenController.furnishedList
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
                  screenController.furnishedValue.value = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Bathrooms DD
  Widget bathroomsDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Bathrooms"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.bathRoomsValue,
                items: screenController.intList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.bathRoomsValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Ac DD
  Widget acDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "AC"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.acValue,
                items: screenController.intList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.acValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Bed DD
  Widget bedDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Bed"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.bedValue,
                items: screenController.intList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.bedValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Wardrobe DD
  Widget wardrobeDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Wardrobe"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.wardrobeValue,
                items: screenController.intList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.wardrobeValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Tv DD
  Widget tvDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "TV"),
        Container(
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
              child: DropdownButton<int>(
                value: screenController.tvValue,
                items: screenController.intList
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.tvValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Checkbox Gridview List
  Widget checkBoxGridViewModule() {
    return Obx(() => screenController.isLoading.value
        ? const CustomCircularProgressIndicatorModule()
        : screenController.propertyTypeValue.sub == "house"
            ? GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 5,
                ),
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[0].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[0].value =
                              !screenController.featuresCheckboxList[0].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[0].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[0].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[1].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[1].value =
                              !screenController.featuresCheckboxList[1].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[1].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[1].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[2].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[2].value =
                              !screenController.featuresCheckboxList[2].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[2].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[2].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[3].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[3].value =
                              !screenController.featuresCheckboxList[3].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[3].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[3].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[4].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[4].value =
                              !screenController.featuresCheckboxList[4].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[4].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[4].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => AppColors.blueColor),
                        value: screenController.featuresCheckboxList[5].value,
                        onChanged: (bool? value) {
                          screenController.isLoading(true);
                          screenController.featuresCheckboxList[5].value =
                              !screenController.featuresCheckboxList[5].value;
                          log("singleItem.value : ${screenController.featuresCheckboxList[5].value}");
                          screenController.isLoading(false);
                        },
                      ),
                      Expanded(
                        child: Text(
                          screenController.featuresCheckboxList[5].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : screenController.propertyTypeValue.sub == "office"
                ? GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 5,
                    ),
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[0].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[0].value =
                                  !screenController
                                      .featuresCheckboxList[0].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[0].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[0].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[1].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[1].value =
                                  !screenController
                                      .featuresCheckboxList[1].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[1].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[1].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[5].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[5].value =
                                  !screenController
                                      .featuresCheckboxList[5].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[5].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[5].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[6].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[6].value =
                                  !screenController
                                      .featuresCheckboxList[6].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[6].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[6].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[7].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[7].value =
                                  !screenController
                                      .featuresCheckboxList[7].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[7].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[7].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.blueColor),
                            value:
                                screenController.featuresCheckboxList[9].value,
                            onChanged: (bool? value) {
                              screenController.isLoading(true);
                              screenController.featuresCheckboxList[9].value =
                                  !screenController
                                      .featuresCheckboxList[9].value;
                              log("singleItem.value : ${screenController.featuresCheckboxList[9].value}");
                              screenController.isLoading(false);
                            },
                          ),
                          Expanded(
                            child: Text(
                              screenController.featuresCheckboxList[9].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : screenController.propertyTypeValue.sub == "textile"
                    ? GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 5,
                        ),
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => AppColors.blueColor),
                                value: screenController
                                    .featuresCheckboxList[1].value,
                                onChanged: (bool? value) {
                                  screenController.isLoading(true);
                                  screenController
                                          .featuresCheckboxList[1].value =
                                      !screenController
                                          .featuresCheckboxList[1].value;
                                  log("singleItem.value : ${screenController.featuresCheckboxList[1].value}");
                                  screenController.isLoading(false);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  screenController.featuresCheckboxList[1].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => AppColors.blueColor),
                                value: screenController
                                    .featuresCheckboxList[6].value,
                                onChanged: (bool? value) {
                                  screenController.isLoading(true);
                                  screenController
                                          .featuresCheckboxList[6].value =
                                      !screenController
                                          .featuresCheckboxList[6].value;
                                  log("singleItem.value : ${screenController.featuresCheckboxList[6].value}");
                                  screenController.isLoading(false);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  screenController.featuresCheckboxList[6].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => AppColors.blueColor),
                                value: screenController
                                    .featuresCheckboxList[7].value,
                                onChanged: (bool? value) {
                                  screenController.isLoading(true);
                                  screenController
                                          .featuresCheckboxList[7].value =
                                      !screenController
                                          .featuresCheckboxList[7].value;
                                  log("singleItem.value : ${screenController.featuresCheckboxList[7].value}");
                                  screenController.isLoading(false);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  screenController.featuresCheckboxList[7].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => AppColors.blueColor),
                                value: screenController
                                    .featuresCheckboxList[9].value,
                                onChanged: (bool? value) {
                                  screenController.isLoading(true);
                                  screenController
                                          .featuresCheckboxList[9].value =
                                      !screenController
                                          .featuresCheckboxList[9].value;
                                  log("singleItem.value : ${screenController.featuresCheckboxList[9].value}");
                                  screenController.isLoading(false);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  screenController.featuresCheckboxList[9].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : screenController.propertyTypeValue.sub == "industrial"
                        ? GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 5,
                            ),
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[5].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[5].value =
                                          !screenController
                                              .featuresCheckboxList[5].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[5].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[5].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[6].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[6].value =
                                          !screenController
                                              .featuresCheckboxList[6].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[6].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[6].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[7].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[7].value =
                                          !screenController
                                              .featuresCheckboxList[7].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[7].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[7].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[11].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[11].value =
                                          !screenController
                                              .featuresCheckboxList[11].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[11].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[11].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[12].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[12].value =
                                          !screenController
                                              .featuresCheckboxList[12].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[12].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[12].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[13].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[13].value =
                                          !screenController
                                              .featuresCheckboxList[13].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[13].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[13].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => AppColors.blueColor),
                                    value: screenController
                                        .featuresCheckboxList[8].value,
                                    onChanged: (bool? value) {
                                      screenController.isLoading(true);
                                      screenController
                                              .featuresCheckboxList[8].value =
                                          !screenController
                                              .featuresCheckboxList[8].value;
                                      log("singleItem.value : ${screenController.featuresCheckboxList[8].value}");
                                      screenController.isLoading(false);
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      screenController
                                          .featuresCheckboxList[8].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : screenController.propertyTypeValue.sub == "plot"
                            ? GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 5,
                                ),
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    AppColors.blueColor),
                                        value: screenController
                                            .featuresCheckboxList[11].value,
                                        onChanged: (bool? value) {
                                          screenController.isLoading(true);
                                          screenController
                                                  .featuresCheckboxList[11]
                                                  .value =
                                              !screenController
                                                  .featuresCheckboxList[11]
                                                  .value;
                                          log("singleItem.value : ${screenController.featuresCheckboxList[11].value}");
                                          screenController.isLoading(false);
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          screenController
                                              .featuresCheckboxList[11].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    AppColors.blueColor),
                                        value: screenController
                                            .featuresCheckboxList[12].value,
                                        onChanged: (bool? value) {
                                          screenController.isLoading(true);
                                          screenController
                                                  .featuresCheckboxList[12]
                                                  .value =
                                              !screenController
                                                  .featuresCheckboxList[12]
                                                  .value;
                                          log("singleItem.value : ${screenController.featuresCheckboxList[12].value}");
                                          screenController.isLoading(false);
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          screenController
                                              .featuresCheckboxList[12].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    AppColors.blueColor),
                                        value: screenController
                                            .featuresCheckboxList[13].value,
                                        onChanged: (bool? value) {
                                          screenController.isLoading(true);
                                          screenController
                                                  .featuresCheckboxList[13]
                                                  .value =
                                              !screenController
                                                  .featuresCheckboxList[13]
                                                  .value;
                                          log("singleItem.value : ${screenController.featuresCheckboxList[13].value}");
                                          screenController.isLoading(false);
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          screenController
                                              .featuresCheckboxList[13].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    AppColors.blueColor),
                                        value: screenController
                                            .featuresCheckboxList[8].value,
                                        onChanged: (bool? value) {
                                          screenController.isLoading(true);
                                          screenController
                                                  .featuresCheckboxList[8]
                                                  .value =
                                              !screenController
                                                  .featuresCheckboxList[8]
                                                  .value;
                                          log("singleItem.value : ${screenController.featuresCheckboxList[8].value}");
                                          screenController.isLoading(false);
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          screenController
                                              .featuresCheckboxList[8].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : screenController.propertyTypeValue.sub == "shed"
                                ? GridView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 5,
                                    ),
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            fillColor: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    AppColors.blueColor),
                                            value: screenController
                                                .featuresCheckboxList[11].value,
                                            onChanged: (bool? value) {
                                              screenController.isLoading(true);
                                              screenController
                                                      .featuresCheckboxList[11]
                                                      .value =
                                                  !screenController
                                                      .featuresCheckboxList[11]
                                                      .value;
                                              log("singleItem.value : ${screenController.featuresCheckboxList[11].value}");
                                              screenController.isLoading(false);
                                            },
                                          ),
                                          Expanded(
                                            child: Text(
                                              screenController
                                                  .featuresCheckboxList[11]
                                                  .name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            fillColor: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    AppColors.blueColor),
                                            value: screenController
                                                .featuresCheckboxList[12].value,
                                            onChanged: (bool? value) {
                                              screenController.isLoading(true);
                                              screenController
                                                      .featuresCheckboxList[12]
                                                      .value =
                                                  !screenController
                                                      .featuresCheckboxList[12]
                                                      .value;
                                              log("singleItem.value : ${screenController.featuresCheckboxList[12].value}");
                                              screenController.isLoading(false);
                                            },
                                          ),
                                          Expanded(
                                            child: Text(
                                              screenController
                                                  .featuresCheckboxList[12]
                                                  .name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            fillColor: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    AppColors.blueColor),
                                            value: screenController
                                                .featuresCheckboxList[13].value,
                                            onChanged: (bool? value) {
                                              screenController.isLoading(true);
                                              screenController
                                                      .featuresCheckboxList[13]
                                                      .value =
                                                  !screenController
                                                      .featuresCheckboxList[13]
                                                      .value;
                                              log("singleItem.value : ${screenController.featuresCheckboxList[13].value}");
                                              screenController.isLoading(false);
                                            },
                                          ),
                                          Expanded(
                                            child: Text(
                                              screenController
                                                  .featuresCheckboxList[13]
                                                  .name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            fillColor: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    AppColors.blueColor),
                                            value: screenController
                                                .featuresCheckboxList[8].value,
                                            onChanged: (bool? value) {
                                              screenController.isLoading(true);
                                              screenController
                                                      .featuresCheckboxList[8]
                                                      .value =
                                                  !screenController
                                                      .featuresCheckboxList[8]
                                                      .value;
                                              log("singleItem.value : ${screenController.featuresCheckboxList[8].value}");
                                              screenController.isLoading(false);
                                            },
                                          ),
                                          Expanded(
                                            child: Text(
                                              screenController
                                                  .featuresCheckboxList[8].name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container());
  }

  // Super Area
  Widget superAreaFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Super Area in Sq.ft"),
        TextFormField(
          controller: screenController.superAreaController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Carpet Area
  Widget carpetAreaFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Carpet Area in Sq.ft"),
        TextFormField(
          controller: screenController.carpetAreaController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
          onChanged: (value) {
            if(screenController.monthlyRentController.text == "" || screenController.varVighaYardController.text == "") {
              screenController.perSqFtRateController.clear();
            }
            else if(screenController.varVighaYardController.text != "") {
              int varVigha = int.parse(screenController.varVighaYardController.text);
              int rent = int.parse(screenController.monthlyRentController.text);

              var sqRate = rent/varVigha;
              screenController.perSqFtRateController.text = sqRate.toString();
              log("superAreaController : ${screenController.perSqFtRateController.text}");
            }
            screenController.loadUI();
          },
        )
      ],
    );
  }

  // Var/Vigha/Yard
  Widget varVighaYardFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Var/Vigha/Yard"),
        TextFormField(
          controller: screenController.varVighaYardController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
          onChanged: (value) {
            if(screenController.monthlyRentController.text == "" || screenController.varVighaYardController.text == "") {
              screenController.superAreaController.clear();
            }
            else if(screenController.varVighaYardController.text != "") {
              int varVigha = int.parse(screenController.varVighaYardController.text);
              int rent = int.parse(screenController.monthlyRentController.text);

              var sqRate = rent/varVigha;
              screenController.superAreaController.text = sqRate.toString();
              log("superAreaController : ${screenController.superAreaController.text}");
            }
            screenController.loadUI();
          },
        )
      ],
    );
  }

  // Height
  Widget heightFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Height"),
        TextFormField(
          controller: screenController.heightController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Available From Radio Button
  Widget availableFromModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Available From"),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<PropertyAvailability>(
                    value: PropertyAvailability.immediate,
                    groupValue: screenController.propertyAvailability,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.propertyAvailability = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Immediately"),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                children: [
                  Radio<PropertyAvailability>(
                    value: PropertyAvailability.date,
                    groupValue: screenController.propertyAvailability,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.propertyAvailability = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Select Date"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Age Of Construction DD
  Widget ageOfConstructionDropDownModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Age of Construction"),
        Container(
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
                value: screenController.ageOfConstructionValue,
                items: screenController.ageOfConstructionList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.ageOfConstructionValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Date Module
  Widget datePickerModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Available Date"),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${screenController.selectedDate.day}-"
                "${screenController.selectedDate.month}-"
                "${screenController.selectedDate.year}",
                style: const TextStyle(fontSize: 16),
              ).commonSymmetricPadding(horizontal: 14),
              GestureDetector(
                onTap: () async => await _selectDate(context),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  // size: 20,
                ),
              ),
            ],
          ).commonAllSidePadding(padding: 10),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: screenController.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != screenController.selectedDate) {
      screenController.isLoading(true);
      screenController.selectedDate = picked;
      screenController.isLoading(false);
    }
  }

  // Other Details Radio Button
  Widget otherDetailsRadioButtonModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "is there a separate utility area for cleaning/washing?",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey,
          ),
        ).commonAllSidePadding(padding: 5),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<SeparateCleaningArea>(
                    value: SeparateCleaningArea.yes,
                    groupValue: screenController.separateCleaningArea,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.separateCleaningArea = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Yes"),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                children: [
                  Radio<SeparateCleaningArea>(
                    value: SeparateCleaningArea.no,
                    groupValue: screenController.separateCleaningArea,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.separateCleaningArea = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Lifts in tower
  Widget liftsInTowerFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Lifts in Tower"),
        TextFormField(
          controller: screenController.liftsInTowerController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Units on the floor
  Widget unitsOnTheFloorFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Units on the floor"),
        TextFormField(
          controller: screenController.unitsOnFloorController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Price
  Widget salePriceFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Sale Price"),
        TextFormField(
          controller: screenController.monthlyRentController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          validator: (value) => FieldValidations().validateFullName(value!),
          onChanged: (value) {
            if(screenController.propertyTypeValue.sub == "plot") {
              if(screenController.monthlyRentController.text == "" || screenController.varVighaYardController.text == "") {
                screenController.perSqFtRateController.clear();
              }
              else if(screenController.varVighaYardController.text != "") {
                int varVigha = int.parse(screenController.varVighaYardController.text);
                int rent = int.parse(screenController.monthlyRentController.text);
                var sqRate = rent/varVigha;
                screenController.perSqFtRateController.text = sqRate.toString();
                log("perSqFtRateController : ${screenController.perSqFtRateController.text}");
              }
            }
            else {
              if (screenController.monthlyRentController.text == "" || screenController.superAreaController.text == "") {
                screenController.perSqFtRateController.clear();
              }
              else if (screenController.superAreaController.text != "") {
                int cArea = int.parse(screenController.superAreaController.text);
                int rent = int.parse(screenController.monthlyRentController.text);
                var sqRate = rent / cArea;
                screenController.perSqFtRateController.text = sqRate.toString();
                log("perSqFtRateController : ${screenController
                    .perSqFtRateController.text}");
              }
            }
            screenController.loadUI();
          },
        ),
      ],
    );
  }

  // Negotiable
  Widget negotiableCheckbox() {
    return Column(
      children: [
        const Header2(text: ""),
        Row(
          children: [
            Obx(
              () => Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.blueColor),
                value: screenController.isNegotiable.value,
                onChanged: (bool? value) {
                  screenController.isNegotiable.value =
                      !screenController.isNegotiable.value;
                  log("isNegotiable : ${screenController.isNegotiable.value}");
                },
              ),
            ),
            const Text("Negotiable"),
          ],
        ),
      ],
    );
  }

  // Loan Amount
  Widget loanAmountFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Loan Amount"),
        TextFormField(
          controller: screenController.loanAmountController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  // Sq Ft Rate
  Widget perSrFtRateFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Per Sq. Ft Rate"),
        TextFormField(
          controller: screenController.perSqFtRateController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }
}

class SaleTenantDetailsModule extends StatelessWidget {
  SaleTenantDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header1(text: "Additional Features"),
        screenController.propertyTypeValue.sub == "house"
            ? _additionalRoom()
            : Container(),
        _facing(context),
        screenController.propertyTypeValue.sub == "house"
            ? _overLooking()
            : Container(),
        totalCarParkingFieldModule(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: coveredCarParkingFieldModule()),
            const SizedBox(width: 8),
            Expanded(child: openCarParkingFieldModule()),
          ],
        ),
        const Divider(),
        const Header1(text: "Status of Water & Electricity"),
        _waterAvailability(context),
        _electricityAvailability(context),
        const Header1(text: "Landmarks"),
        landMarkFieldModule(),
        const Divider(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? const Header1(text: "Flooring and Amenities")
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _flooring()
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _amenities()
            : Container(),
      ],
    );
  }

  /*Widget _bachelors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Tenants who are Bachelors"),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<TenantBachelors>(
                    value: TenantBachelors.yes,
                    groupValue: screenController.tenantBachelors,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantBachelors = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Yes"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantBachelors>(
                    value: TenantBachelors.no,
                    groupValue: screenController.tenantBachelors,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantBachelors = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantBachelors>(
                    value: TenantBachelors.noMatter,
                    groupValue: screenController.tenantBachelors,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantBachelors = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No Matter"),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }*/

  /*Widget _nonVegetarians() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Tenants who are Non vegetarians"),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<TenantNonVegetarian>(
                    value: TenantNonVegetarian.yes,
                    groupValue: screenController.tenantNonVegetarian,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantNonVegetarian = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Yes"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantNonVegetarian>(
                    value: TenantNonVegetarian.no,
                    groupValue: screenController.tenantNonVegetarian,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantNonVegetarian = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantNonVegetarian>(
                    value: TenantNonVegetarian.noMatter,
                    groupValue: screenController.tenantNonVegetarian,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantNonVegetarian = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No Matter"),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }*/

  /*Widget _pets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Tenants with Pets"),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<TenantPets>(
                    value: TenantPets.yes,
                    groupValue: screenController.tenantPets,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantPets = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Yes"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantPets>(
                    value: TenantPets.no,
                    groupValue: screenController.tenantPets,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantPets = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantPets>(
                    value: TenantPets.noMatter,
                    groupValue: screenController.tenantPets,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantPets = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No Matter"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }*/

  /*Widget _companyLease() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Tenants with Pets"),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<TenantCompanyLease>(
                    value: TenantCompanyLease.yes,
                    groupValue: screenController.tenantCompanyLease,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantCompanyLease = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("Yes"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantCompanyLease>(
                    value: TenantCompanyLease.no,
                    groupValue: screenController.tenantCompanyLease,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantCompanyLease = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<TenantCompanyLease>(
                    value: TenantCompanyLease.noMatter,
                    groupValue: screenController.tenantCompanyLease,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.tenantCompanyLease = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Text("No Matter"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }*/

  Widget _additionalRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Additional Rooms"),
        GridView.builder(
          itemCount: screenController.additionalRoomsList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.blueColor),
                  value: screenController.additionalRoomsList[i].value,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.additionalRoomsList[i].value =
                        !screenController.additionalRoomsList[i].value;
                    log("isNegotiable : ${screenController.additionalRoomsList[i].value}");
                    screenController.isLoading(false);
                  },
                ),
                Text(screenController.additionalRoomsList[i].name),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _facing(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Facing"),
        Container(
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
                value: screenController.facingValue,
                items: screenController.facingList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.facingValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _overLooking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Overlooking"),
        GridView.builder(
          itemCount: screenController.overlookingList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.blueColor),
                  value: screenController.overlookingList[i].value,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.overlookingList[i].value =
                        !screenController.overlookingList[i].value;
                    log("${screenController.overlookingList[i].value}");
                    screenController.isLoading(false);
                  },
                ),
                Text(screenController.overlookingList[i].name),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget totalCarParkingFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Total Car Parking"),
        TextFormField(
          controller: screenController.totalCarParkingController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          onChanged: (value) {
            screenController.openCarParkingController.text =
                screenController.totalCarParkingController.text;
          },
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget coveredCarParkingFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Covered Car Parking"),
        TextFormField(
          controller: screenController.coveredCarParkingController,
          keyboardType: TextInputType.number,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          onChanged: (value) {
            screenController.openCarParkingController.text =
                (int.parse(screenController.totalCarParkingController.text) -
                        int.parse(
                            screenController.coveredCarParkingController.text))
                    .toString();
          },
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget openCarParkingFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Open Car Parking"),
        TextFormField(
          controller: screenController.openCarParkingController,
          keyboardType: TextInputType.number,
          // enabled: false,
          readOnly: true,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget _waterAvailability(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Availability of Water"),
        Container(
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
                value: screenController.availabilityOfWaterValue,
                items: screenController.availabilityOfWaterList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.availabilityOfWaterValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _electricityAvailability(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Status of Electricity"),
        Container(
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
                value: screenController.availabilityOfElectricityValue,
                items: screenController.availabilityOfWaterList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.availabilityOfElectricityValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget landMarkFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Land Mark & Near by"),
        TextFormField(
          controller: screenController.landMarkAndNearByController,
          keyboardType: TextInputType.text,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget _flooring() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Flooring"),
        GridView.builder(
          itemCount: screenController.flooringList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.blueColor),
                  value: screenController.flooringList[i].value,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.flooringList[i].value =
                        !screenController.flooringList[i].value;
                    log("${screenController.flooringList[i].value}");
                    screenController.isLoading(false);
                  },
                ),
                Expanded(
                  child: Text(
                    screenController.flooringList[i].name,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _amenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Amenities"),
        GridView.builder(
          itemCount: screenController.aminitiesList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return screenController.propertyTypeValue.sub != "house"
                ? i == 0 || i ==1 || i == 7
                ? Container()
                : Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                          (states) => AppColors.blueColor),
                  value: screenController.aminitiesList[i].value,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.aminitiesList[i].value =
                    !screenController.aminitiesList[i].value;
                    log("${screenController.aminitiesList[i].value}");
                    screenController.isLoading(false);
                  },
                ),
                Expanded(
                  child: Text(
                    screenController.aminitiesList[i].name,
                    maxLines: 2,
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.blueColor),
                  value: screenController.aminitiesList[i].value,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.aminitiesList[i].value =
                        !screenController.aminitiesList[i].value;
                    log("${screenController.aminitiesList[i].value}");
                    screenController.isLoading(false);
                  },
                ),
                Expanded(
                  child: Text(
                    screenController.aminitiesList[i].name,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class SaleOwnerDetailsModule extends StatelessWidget {
  SaleOwnerDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SellerCreatePropertyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Header1(text: "Tenant Preferences"),
        // _visitorsRestriction(),
        // _tenantRestrictionFieldModule(),
        // _tenantPrefer(),
        // const Divider(),

        const Header1(text: "Preferred Time to Call?"),
        _preferredTimeCallModule(),
        screenController.isAnyTime.value == false ? _preferredDaysToCall() : Container(),
        screenController.isAnyTime.value == false ? Row(
          children: [
            Expanded(child: _fromTimeModule(context)),
            const SizedBox(width: 8),
            Expanded(child: _toTimeModule(context)),
          ],
        ) : Container(),
        const Divider(),

        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? const Header1(text: "Question & Answer")
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _securityFeaturesFieldModule()
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _occupantsStayFieldModule()
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _crossViolationModule()
            : Container(),
        screenController.propertyTypeValue.sub == "house" ||
                screenController.propertyTypeValue.sub == "office" ||
                screenController.propertyTypeValue.sub == "textile"
            ? _commonWallModule()
            : Container(),

        const Divider(),
        _agreeTermsAndConditionModule(),
      ],
    );
  }

  /*Widget _visitorsRestriction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Any restrictions for visitors?"),
        Column(
          children: [
            Row(
              children: [
                Radio<VisitorsRestriction>(
                  value: VisitorsRestriction.noRestriction,
                  groupValue: screenController.visitorsRestriction,
                  onChanged: (value) {
                    screenController.isLoading(true);
                    screenController.visitorsRestriction = value!;
                    screenController.isLoading(false);
                  },
                ),
                const Text("No Restriction"),
              ],
            ),
            Row(
              children: [
                Radio<VisitorsRestriction>(
                  value: VisitorsRestriction.overNightStayNotAllow,
                  groupValue: screenController.visitorsRestriction,
                  onChanged: (value) {
                    screenController.isLoading(true);
                    screenController.visitorsRestriction = value!;
                    screenController.isLoading(false);
                  },
                ),
                const Text("Overnight stay not allowed"),
              ],
            ),
            Row(
              children: [
                Radio<VisitorsRestriction>(
                  value: VisitorsRestriction.visitorsNotAllowed,
                  groupValue: screenController.visitorsRestriction,
                  onChanged: (value) {
                    screenController.isLoading(true);
                    screenController.visitorsRestriction = value!;
                    screenController.isLoading(false);
                  },
                ),
                const Text("Visitors not allowed"),
              ],
            ),
          ],
        ),

      ],
    );
  }*/

  /*Widget _tenantRestrictionFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add restrictions for tenants regarding parties/music/noise?",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey,
          ),
        ).commonAllSidePadding(padding: 5),
        TextFormField(
          controller: screenController.tenantRestrictionController,
          keyboardType: TextInputType.text,
          decoration: sellerCreatePropertyFieldDecoration(hintText: '',screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }*/

  /*Widget _tenantPrefer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Tenant you prefer"),
        GridView.builder(
          itemCount: screenController.preferTenantList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((states) => AppColors.blueColor),
                  value: screenController.preferTenantList[i].value,
                  onChanged: (bool? value) {
                    screenController.preferTenantList[i].value =
                    !screenController.preferTenantList[i].value;
                    log("${screenController.preferTenantList[i].value}");
                  },
                ),
                Expanded(
                  child: Text(
                    screenController.preferTenantList[i].name,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }*/

  Widget _preferredTimeCallModule() {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.blueColor),
          value: screenController.isAnyTime.value,
          onChanged: (bool? value) {
            screenController.isLoading(true);
            screenController.isAnyTime.value =
                !screenController.isAnyTime.value;
            log("${screenController.isAnyTime.value}");
            screenController.isLoading(false);
          },
        ),
        const Expanded(
          child: Text(
            "Anytime",
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _preferredDaysToCall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Preferred days to call"),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<PreferredDayCall>(
                        value: PreferredDayCall.anyDay,
                        groupValue: screenController.preferredDayCall,
                        onChanged: (value) {
                          screenController.isLoading(true);
                          screenController.preferredDayCall = value!;
                          screenController.isLoading(false);
                        },
                      ),
                      const Expanded(child: Text("Any Day")),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<PreferredDayCall>(
                        value: PreferredDayCall.weekdaysOnly,
                        groupValue: screenController.preferredDayCall,
                        onChanged: (value) {
                          screenController.isLoading(true);
                          screenController.preferredDayCall = value!;
                          screenController.isLoading(false);
                        },
                      ),
                      const Expanded(child: Text("Weekdays Only")),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<PreferredDayCall>(
                        value: PreferredDayCall.weekendsOnly,
                        groupValue: screenController.preferredDayCall,
                        onChanged: (value) {
                          screenController.isLoading(true);
                          screenController.preferredDayCall = value!;
                          screenController.isLoading(false);
                        },
                      ),
                      const Expanded(child: Text("Weekends Only")),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<PreferredDayCall>(
                        value: PreferredDayCall.sundayOnly,
                        groupValue: screenController.preferredDayCall,
                        onChanged: (value) {
                          screenController.isLoading(true);
                          screenController.preferredDayCall = value!;
                          screenController.isLoading(false);
                        },
                      ),
                      const Expanded(child: Text("Sunday Only")),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _fromTimeModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "From Time"),
        Container(
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
                value: screenController.fromTimeValue,
                items: screenController.timeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.fromTimeValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toTimeModule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "To Time"),
        Container(
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
                value: screenController.toTimeValue,
                items: screenController.timeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.toTimeValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _securityFeaturesFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Security features in the project",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey,
          ),
        ).commonAllSidePadding(padding: 5),
        TextFormField(
          controller: screenController.securityFeaturesController,
          keyboardType: TextInputType.text,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget _occupantsStayFieldModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How many occupants stay in this project?(Specify as %)",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey,
          ),
        ).commonAllSidePadding(padding: 5),
        TextFormField(
          controller: screenController.occupantsStayController,
          keyboardType: TextInputType.text,
          decoration: sellerCreatePropertyFieldDecoration(
              hintText: '', screenController: screenController),
          // validator: (value) => FieldValidations().validateFullName(value!),
        )
      ],
    );
  }

  Widget _crossViolationModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Is there appropriate cross-ventilation?"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<CrossViolation>(
                    value: CrossViolation.yes,
                    groupValue: screenController.crossViolation,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.crossViolation = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Expanded(child: Text("Yes")),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<CrossViolation>(
                    value: CrossViolation.no,
                    groupValue: screenController.crossViolation,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.crossViolation = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Expanded(child: Text("No")),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _commonWallModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Are there common walls between two Units?"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio<CommonWall>(
                    value: CommonWall.yes,
                    groupValue: screenController.commonWall,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.commonWall = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Expanded(child: Text("Yes")),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<CommonWall>(
                    value: CommonWall.no,
                    groupValue: screenController.commonWall,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      screenController.commonWall = value!;
                      screenController.isLoading(false);
                    },
                  ),
                  const Expanded(child: Text("No")),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _agreeTermsAndConditionModule() {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.blueColor),
          value: screenController.isTermAndCondition.value,
          onChanged: (bool? value) {
            screenController.isLoading(true);
            screenController.isTermAndCondition.value =
                !screenController.isTermAndCondition.value;
            log("${screenController.isTermAndCondition.value}");
            screenController.isLoading(false);
          },
        ),
        const Expanded(
          child: Text(
            "Agree Terms & Conditions",
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
