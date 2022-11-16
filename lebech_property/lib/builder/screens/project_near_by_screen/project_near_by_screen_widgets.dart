import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_near_by_screen_controller/project_near_by_screen_controller.dart';
import 'package:lebech_property/builder/models/project_near_by_screen_models/project_near_by_model.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';


class AddNearBySingleModule extends StatefulWidget {
  TextEditingController nearByController;
  TextEditingController nearByTravelTimeController;
  List<bool> nearByStatusList;
  bool nearByStatus;
  int index;
  AddNearBySingleModule({Key? key,
    required this.nearByController,
    required this.nearByTravelTimeController,
    required this.nearByStatusList,
    required this.nearByStatus,
    required this.index,
  }) : super(key: key);

  @override
  State<AddNearBySingleModule> createState() => _AddNearBySingleModuleState();
}
class _AddNearBySingleModuleState extends State<AddNearBySingleModule> {
  final screenController = Get.find<ProjectNearByScreenController>();

  // TextEditingController addNearByController = TextEditingController();
  // TextEditingController travelTimeController = TextEditingController();
  // List<bool> addNearByStatusList = [true, false];
  // bool nearByStatus = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header2(text: "Near By"),
                      TextFormField(
                        controller: widget.nearByController,
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
                        controller: widget.nearByTravelTimeController,
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
                              value: widget.nearByStatus,
                              items: widget.nearByStatusList
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
                                  widget.nearByStatus = value!;
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
        ),

        widget.index == 0 ? Container() : Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              screenController.isLoading(true);
              screenController.nearByList.removeAt(widget.index);
              screenController.nearByTextControllerList.removeAt(widget.index);
              screenController.nearByTravelTimeControllerList.removeAt(widget.index);
              screenController.isLoading(false);
            } ,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blueColor,
              ),
              child: const Center(
                child: Icon(Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ).commonAllSidePadding(padding: 2),
            ),
          ),
        ),
      ],
    ).commonSymmetricPadding(vertical: 3);
  }
}



class NearByListModule extends StatelessWidget {
  NearByListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectNearByScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.nearByApiList.isEmpty
        ? const Text("No Data Available!")
        : ListView.builder(
      itemCount: screenController.nearByApiList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        NearByDatum singleItem = screenController.nearByApiList[i];
        return _priceRangeListTile(singleItem);
      },
    );
  }

  Widget _priceRangeListTile(NearByDatum singleItem) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Near By",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.name)),
            ],
          ),
          const SizedBox(width: 5),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Travel Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.time)),
            ],
          ),
          const SizedBox(width: 5),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(singleItem.active == 1 ? "True" : "False"),
              ),
            ],
          ),

        ],
      ).commonAllSidePadding(padding: 5),
    ).commonAllSidePadding(padding: 5);
  }

}