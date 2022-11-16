import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_price_range_screen_controller/project_price_range_screen_controller.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/project_price_range_model.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/field_decorations.dart';


class PriceRangeSingleItemModule extends StatefulWidget {
  TextEditingController priceRangeTypeController;
  TextEditingController priceRangeSellPriceController;
  TextEditingController priceRangeAreaController;
  List<bool> priceRangeStatusList;
  bool priceRangeStatus;
  int index;
  PriceRangeSingleItemModule({Key? key,
    required this.priceRangeTypeController,
    required this.priceRangeSellPriceController,
    required this.priceRangeAreaController,
    required this.priceRangeStatusList,
    required this.priceRangeStatus,
    required this.index,
  }) : super(key: key);


  @override
  State<PriceRangeSingleItemModule> createState() => _PriceRangeSingleItemModuleState();
}
class _PriceRangeSingleItemModuleState extends State<PriceRangeSingleItemModule> {
  final screenController = Get.find<ProjectPriceRangeScreenController>();

  // TextEditingController priceRangeTypeController = TextEditingController();
  // TextEditingController priceRangeSellPriceController = TextEditingController();
  // TextEditingController priceRangeAreaController = TextEditingController();
  // List<bool> priceRangeStatusList = [true, false];
  // bool priceRangeStatus = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header2(text: "Type"),
                      TextFormField(
                        controller: widget.priceRangeTypeController,
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
                        controller: widget.priceRangeSellPriceController,
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
                        controller: widget.priceRangeAreaController,
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
                              value: widget.priceRangeStatus,
                              items: widget.priceRangeStatusList
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
                                  widget.priceRangeStatus = value!;
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
        ),

        widget.index == 0 ? Container() : Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              screenController.isLoading(true);
              screenController.priceRangeList.removeAt(widget.index);
              screenController.priceRangeTypeTeControllerList.removeAt(widget.index);
              screenController.priceRangeSellPriceControllerList.removeAt(widget.index);
              screenController.priceRangeAreaControllerList.removeAt(widget.index);
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

class PriceRangeListModule extends StatelessWidget {
  PriceRangeListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProjectPriceRangeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.priceRangeApiList.isEmpty
    ? const Text("No Data Available!")
    : ListView.builder(
      itemCount: screenController.priceRangeApiList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        ProjectPriceRangeDatum singleItem = screenController.priceRangeApiList[i];
        return _priceRangeListTile(singleItem);
      },
    );
  }

  Widget _priceRangeListTile(ProjectPriceRangeDatum singleItem) {
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
                  "Type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.type)),
            ],
          ),
          const SizedBox(width: 5),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Price",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.price)),
            ],
          ),
          const SizedBox(width: 5),

          Row(
            children: [
              const Expanded(
                child: Text(
                  "Area",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(singleItem.area)),
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
