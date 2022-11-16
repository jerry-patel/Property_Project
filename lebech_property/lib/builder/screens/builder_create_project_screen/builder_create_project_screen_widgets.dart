import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_create_project_screen_controller/builder_create_project_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';
import 'package:lebech_property/seller/models/seller_create_property_screen_model/form_basic_details_model.dart';


class ProjectNameFieldModule extends StatelessWidget {
  ProjectNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
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
            controller: screenController.projectNameController,
            decoration: builderCreateProjectFieldDecoration(
                hintText: ''),
          ),
          itemBuilder: (context, String? suggestion) {
            final cat = suggestion!;
            return ListTile(
              title: Text(cat),
            );
          },
          onSuggestionSelected: (String? suggestion) {
            screenController.projectNameController.text = suggestion!;
            log("Text : ${screenController.projectNameController.text}");
          },
        ),

        // TextFormField(
        //   controller: screenController.propertyNameController,
        //   keyboardType: TextInputType.text,
        //   decoration: brokerCreatePropertyFieldDecoration(hintText: '',screenController: screenController),
        //   validator: (value) => FieldValidations().validateFullName(value!),
        // ),
      ],
    );
  }
}

class ProjectCityDropDownModule extends StatelessWidget {
  ProjectCityDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
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
}

class ProjectAreaDropDownModule extends StatelessWidget {
  ProjectAreaDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
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
              items: screenController.stringProjectAreaList,
              key: screenController.projectAreaDropDownProgKey,

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

            /*child: DropdownButtonHideUnderline(
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
}

class ProjectCategoryDropDownModule extends StatelessWidget {
  ProjectCategoryDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Category"),
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
              child: DropdownButton<BasicCategory>(
                value: screenController.categoryValue,
                items: screenController.categoryList
                    .map<DropdownMenuItem<BasicCategory>>((BasicCategory value) {
                  return DropdownMenuItem<BasicCategory>(
                    value: value,
                    child: Text(
                      value.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.categoryValue = value!;
                  screenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FacilitiesGridViewModule extends StatelessWidget {
  FacilitiesGridViewModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header2(text: "Facilities"),
        GridView.builder(
          shrinkWrap: true,
          itemCount: screenController.facilitiesList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(
                          (states) => AppColors.blueColor),
                  value:
                  screenController.facilitiesList[i].isSelected,
                  onChanged: (bool? value) {
                    screenController.isLoading(true);
                    screenController.facilitiesList[i].isSelected =
                    !screenController.facilitiesList[i].isSelected;
                    log("singleItem.value : ${screenController.facilitiesList[i].isSelected}");
                    screenController.isLoading(false);
                  },
                ),
                Expanded(
                  child: Text(
                    screenController.facilitiesList[i].name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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

class ProjectAddressFieldModule extends StatelessWidget {
  ProjectAddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Project Address"),
            TextFormField(
              controller: screenController.projectAddressController,
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateFullName(value!),
            )
          ],
        )
      ],
    );
  }
}

class ProjectOfficeAddressFieldModule extends StatelessWidget {
  ProjectOfficeAddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Project Office Address"),
            TextFormField(
              controller: screenController.projectOfficeAddressController,
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              // validator: (value) => FieldValidations().validateFullName(value!),
            )
          ],
        )
      ],
    );
  }
}

class ProjectPhoneNoFieldModule extends StatelessWidget {
  ProjectPhoneNoFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Phone Number"),
            TextFormField(
              controller: screenController.projectPhoneNoController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateMobile(value!),
            )
          ],
        )
      ],
    );
  }
}

class ProjectEmailFieldModule extends StatelessWidget {
  ProjectEmailFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Email"),
            TextFormField(
              controller: screenController.projectEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateEmail(value!),
            ),
          ],
        )
      ],
    );
  }
}

/*class WhyConsiderProjectFieldModule extends StatelessWidget {
  WhyConsiderProjectFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "Why Consider Project?"),
            TextFormField(
              controller: screenController.whyConsiderProjectController,
              keyboardType: TextInputType.text,
              maxLines: 4,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateFullName(value!),
            ),
            *//*Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  quillEdit.QuillToolbar.basic(controller: screenController.whyConsiderProjectQuillController),
                  const SizedBox(height: 10),
                  quillEdit.QuillEditor.basic(
                    controller: screenController.whyConsiderProjectQuillController,
                    readOnly: false,
                  ),
                ],
              ).commonAllSidePadding(padding: 8),
            ),*//*
          ],
        ),
      ],
    );
  }
}*/

class MoreAboutProjectFieldModule extends StatelessWidget {
  MoreAboutProjectFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "More About Project"),
            TextFormField(
              controller: screenController.moreAboutProjectController,
              keyboardType: TextInputType.text,
              maxLines: 4,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateFullName(value!),
            ),
            /*Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  quillEdit.QuillToolbar.basic(controller: screenController.moreAboutProjectQuillController),
                  const SizedBox(height: 10),
                  quillEdit.QuillEditor.basic(
                    controller: screenController.moreAboutProjectQuillController,
                    readOnly: false,
                  ),
                ],
              ).commonAllSidePadding(padding: 8),
            ),*/
          ],
        ),
      ],
    );
  }
}

class AboutBuilderFieldModule extends StatelessWidget {
  AboutBuilderFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header2(text: "About Builder"),
            TextFormField(
              controller: screenController.aboutBuilderController,
              keyboardType: TextInputType.text,
              maxLines: 4,
              decoration: builderCreateProjectFieldDecoration(hintText: ''),
              validator: (value) => FieldValidations().validateFullName(value!),
            ),
            /*Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  quillEdit.QuillToolbar.basic(controller: screenController.aboutBuilderQuillController),
                  const SizedBox(height: 10),
                  quillEdit.QuillEditor.basic(
                    controller: screenController.aboutBuilderQuillController,
                    readOnly: false,
                  ),
                ],
              ).commonAllSidePadding(padding: 8),
            ),*/
          ],
        ),
      ],
    );
  }
}

class ProjectSaveButton extends StatelessWidget {
  ProjectSaveButton({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.formKey.currentState!.validate()) {
          await screenController.createProjectFunction();
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
}

/*class PriceRangeModule extends StatelessWidget {
  PriceRangeModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header2(text: "Price Range"),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  screenController.isLoading(true);
                  screenController.priceRangeList.add(
                      PriceRangeSingleItemModule()
                  );
                  screenController.isLoading(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ).commonAllSidePadding(padding: 3),
                ),
              ),
            ),
          ],
        ),

        ListView.builder(
          itemCount: screenController.priceRangeList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return screenController.priceRangeList[i];
          },
        ),

        // PriceRangeSingleItemModule(),
      ],
    ).commonSymmetricPadding(vertical: 5);
  }


}*/
/*class PriceRangeSingleItemModule extends StatefulWidget {
  TextEditingController priceRangeTypeController;
  TextEditingController priceRangeSellPriceController;
  TextEditingController priceRangeAreaController;
  List<bool> priceRangeStatusList;
  bool priceRangeStatus;
  PriceRangeSingleItemModule({Key? key,
    required this.priceRangeTypeController,
    required this.priceRangeSellPriceController,
    required this.priceRangeAreaController,
    required this.priceRangeStatusList,
    required this.priceRangeStatus
  }) : super(key: key);


  @override
  State<PriceRangeSingleItemModule> createState() => _PriceRangeSingleItemModuleState();
}
class _PriceRangeSingleItemModuleState extends State<PriceRangeSingleItemModule> {
  // final screenController = Get.find<ProjectPriceRangeScreenController>();

  // TextEditingController priceRangeTypeController = TextEditingController();
  // TextEditingController priceRangeSellPriceController = TextEditingController();
  // TextEditingController priceRangeAreaController = TextEditingController();
  // List<bool> priceRangeStatusList = [true, false];
  // bool priceRangeStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Type"),
                  TextFormField(
                    controller: screenController.priceRangeTypeController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Type (1BHK, 2BHK etc)'),
                    // validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Sell Price"),
                  TextFormField(
                    controller: screenController.priceRangeSellPriceController,
                    keyboardType: TextInputType.number,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Price'),
                    // validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Area in Sq. Ft"),
                  TextFormField(
                    controller: screenController.priceRangeAreaController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Area in Sq. Ft'),
                    // validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Status"),
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
                        child: DropdownButton<bool>(
                          value: screenController.priceRangeStatus,
                          items: screenController.priceRangeStatusList
                              .map<DropdownMenuItem<bool>>((bool value) {
                            return DropdownMenuItem<bool>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // screenController.isLoading(true);
                            setState(() {
                              screenController.priceRangeStatus = value!;
                            });
                            // screenController.isLoading(false);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}*/

/*class PriceRangeSingleItemModule extends StatelessWidget {
  PriceRangeSingleItemModule({Key? key}) : super(key: key);
  // final screenController = Get.find<BuilderCreateProjectScreenController>();

  TextEditingController priceRangeTypeController = TextEditingController();
  TextEditingController priceRangeSellPriceController = TextEditingController();
  TextEditingController priceRangeAreaController = TextEditingController();
  List<bool> priceRangeStatusList = [true, false];
  bool priceRangeStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Type"),
                  TextFormField(
                    controller: priceRangeTypeController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Type (1BHK, 2BHK etc)'),
                    validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Sell Price"),
                  TextFormField(
                    controller: priceRangeSellPriceController,
                    keyboardType: TextInputType.number,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Price'),
                    validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Area in Sq. Ft"),
                  TextFormField(
                    controller: priceRangeAreaController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Area in Sq. Ft'),
                    validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Status"),
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
                        child: DropdownButton<bool>(
                          value: priceRangeStatus,
                          items: priceRangeStatusList
                              .map<DropdownMenuItem<bool>>((bool value) {
                            return DropdownMenuItem<bool>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // screenController.isLoading(true);
                            priceRangeStatus = value!;

                            // screenController.isLoading(false);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}*/

/*class AddNearbyModule extends StatelessWidget {
  AddNearbyModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header2(text: "Add Near By"),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  screenController.isLoading(true);
                  screenController.addNearByList.add(AddNearBySingleModule());
                  screenController.isLoading(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ).commonAllSidePadding(padding: 3),
                ),
              ),
            ),
          ],
        ),

        ListView.builder(
          itemCount: screenController.addNearByList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return screenController.addNearByList[i];
          },
        ),
      ],
    ).commonSymmetricPadding(vertical: 5);
  }
}
class AddNearBySingleModule extends StatefulWidget {
  const AddNearBySingleModule({Key? key}) : super(key: key);

  @override
  State<AddNearBySingleModule> createState() => _AddNearBySingleModuleState();
}
class _AddNearBySingleModuleState extends State<AddNearBySingleModule> {

  TextEditingController addNearByController = TextEditingController();
  TextEditingController travelTimeController = TextEditingController();
  List<bool> addNearByStatusList = [true, false];
  bool nearByStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Near By"),
                  TextFormField(
                    controller: addNearByController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Near By'),
                    // validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Travel Time"),
                  TextFormField(
                    controller: travelTimeController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Time to reach'),
                    // validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Status"),
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
                        child: DropdownButton<bool>(
                          value: nearByStatus,
                          items: addNearByStatusList
                              .map<DropdownMenuItem<bool>>((bool value) {
                            return DropdownMenuItem<bool>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // screenController.isLoading(true);
                            setState(() {
                              nearByStatus = value!;
                            });
                            // screenController.isLoading(false);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}*/

/*class AddNearBySingleModule extends StatelessWidget {
  AddNearBySingleModule({Key? key}) : super(key: key);

  TextEditingController addNearByController = TextEditingController();
  TextEditingController travelTimeController = TextEditingController();
  List<bool> addNearByStatusList = [true, false];
  bool nearByStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Near By"),
                  TextFormField(
                    controller: addNearByController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Near By'),
                    validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Travel Time"),
                  TextFormField(
                    controller: travelTimeController,
                    keyboardType: TextInputType.text,
                    decoration: builderCreateProjectFieldDecoration(hintText: 'Time to reach'),
                    validator: (value) => FieldValidations().validateFullName(value!),
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header2(text: "Status"),
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
                        child: DropdownButton<bool>(
                          value: nearByStatus,
                          items: addNearByStatusList
                              .map<DropdownMenuItem<bool>>((bool value) {
                            return DropdownMenuItem<bool>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // screenController.isLoading(true);
                            nearByStatus = value!;
                            // screenController.isLoading(false);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}*/


/*class YouTubeLinkModule extends StatelessWidget {
  YouTubeLinkModule({Key? key}) : super(key: key);
  final screenController = Get.find<BuilderCreateProjectScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Header2(text: "YouTube Video Link"),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  screenController.isLoading(true);
                  screenController.ytVideoLinkList.add(YouTubeVideoLinkModule());
                  screenController.isLoading(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ).commonAllSidePadding(padding: 3),
                ),
              ),
            ),
          ],
        ),

        ListView.builder(
          itemCount: screenController.ytVideoLinkList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return screenController.ytVideoLinkList[i];
          },
        ),
      ],
    ).commonSymmetricPadding(vertical: 5);
  }
}*/
/*class YouTubeVideoLinkModule extends StatefulWidget {
  const YouTubeVideoLinkModule({Key? key}) : super(key: key);

  @override
  State<YouTubeVideoLinkModule> createState() => _YouTubeVideoLinkModuleState();
}
class _YouTubeVideoLinkModuleState extends State<YouTubeVideoLinkModule> {

  TextEditingController ytVideoLinkController = TextEditingController();
  List<bool> ytVideoLinkStatusList = [true, false];
  bool ytLinkStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: ytVideoLinkController,
          keyboardType: TextInputType.text,
          decoration: builderCreateProjectFieldDecoration(hintText: 'YouTube Link'),
          // validator: (value) => FieldValidations().validateFullName(value!),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
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
                    child: DropdownButton<bool>(
                      value: ytLinkStatus,
                      items: ytVideoLinkStatusList
                          .map<DropdownMenuItem<bool>>((bool value) {
                        return DropdownMenuItem<bool>(
                          value: value,
                          child: Text(
                            value.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // screenController.isLoading(true);
                        setState(() {
                          ytLinkStatus = value!;
                        });
                        // screenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }
}*/

// class YouTubeVideoLinkModule extends StatelessWidget {
//   YouTubeVideoLinkModule({Key? key}) : super(key: key);
//
//   TextEditingController ytVideoLinkController = TextEditingController();
//   List<bool> ytVideoLinkStatusList = [true, false];
//   bool ytLinkStatus = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         TextFormField(
//           controller: ytVideoLinkController,
//           keyboardType: TextInputType.text,
//           decoration: builderCreateProjectFieldDecoration(hintText: 'YouTube Link'),
//           validator: (value) => FieldValidations().validateFullName(value!),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.only(left: 10),
//                 width: Get.width, //gives the width of the dropdown button
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   color: Colors.white,
//                   border: Border.all(),
//                 ),
//                 child: Theme(
//                   data: Theme.of(context).copyWith(
//                     canvasColor: Colors.white,
//                     buttonTheme: ButtonTheme.of(context).copyWith(
//                       alignedDropdown: true,
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<bool>(
//                       value: ytLinkStatus,
//                       items: ytVideoLinkStatusList
//                           .map<DropdownMenuItem<bool>>((bool value) {
//                         return DropdownMenuItem<bool>(
//                           value: value,
//                           child: Text(
//                             value.toString(),
//                             style: const TextStyle(color: Colors.black),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         // screenController.isLoading(true);
//                         ytLinkStatus = value!;
//                         // screenController.isLoading(false);
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(child: Container()),
//           ],
//         ),
//       ],
//     );
//   }
// }





