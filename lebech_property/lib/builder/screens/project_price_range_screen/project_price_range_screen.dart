import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_price_range_screen_controller/project_price_range_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'project_price_range_screen_widgets.dart';

class ProjectPriceRangeScreen extends StatelessWidget {
  ProjectPriceRangeScreen({Key? key}) : super(key: key);
  final projectPriceRangeScreenController =
      Get.put(ProjectPriceRangeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectPriceRangeScreenController.title),
        centerTitle: true,
      ),
      body: Obx(
        () => projectPriceRangeScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Header2(text: "Price Range"),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              projectPriceRangeScreenController.isLoading(true);
                              TextEditingController priceRangeTypeController = TextEditingController();
                              TextEditingController priceRangeSellPriceController = TextEditingController();
                              TextEditingController priceRangeAreaController = TextEditingController();
                              List<bool> priceRangeStatusList = [true, false];

                              int iNumber = projectPriceRangeScreenController.priceRangeList.length;
                              // int indexNumber = iNumber+1;

                              projectPriceRangeScreenController.priceRangeTypeTeControllerList.add(priceRangeTypeController);
                              projectPriceRangeScreenController.priceRangeSellPriceControllerList.add(priceRangeSellPriceController);
                              projectPriceRangeScreenController.priceRangeAreaControllerList.add(priceRangeAreaController);
                              projectPriceRangeScreenController.priceRangeStatusMainList.add(priceRangeStatusList);
                              projectPriceRangeScreenController.priceRangeStatusList.add(false);

                              projectPriceRangeScreenController.priceRangeList.add(
                                PriceRangeSingleItemModule(
                                  priceRangeTypeController: projectPriceRangeScreenController.priceRangeTypeTeControllerList[iNumber],
                                  priceRangeSellPriceController: projectPriceRangeScreenController.priceRangeSellPriceControllerList[iNumber],
                                  priceRangeAreaController: projectPriceRangeScreenController.priceRangeAreaControllerList[iNumber],
                                  priceRangeStatusList: projectPriceRangeScreenController.priceRangeStatusMainList[iNumber],
                                  priceRangeStatus: projectPriceRangeScreenController.priceRangeStatusList[iNumber],
                                  index: iNumber,
                                ),
                              );
                              projectPriceRangeScreenController.isLoading(false);
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
                    const SizedBox(height: 5),

                    ListView.builder(
                      itemCount: projectPriceRangeScreenController
                          .priceRangeList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return projectPriceRangeScreenController
                            .priceRangeList[i];
                      },
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // for (int i = 0; i < projectPriceRangeScreenController.priceRangeList.length; i++) {
                            //   log("$i : ${projectPriceRangeScreenController.priceRangeList[i].priceRangeTypeController.text}");
                            //   log("$i : ${projectPriceRangeScreenController.priceRangeList[i].priceRangeSellPriceController.text}");
                            //   log("$i : ${projectPriceRangeScreenController.priceRangeList[i].priceRangeAreaController.text}");
                            //   log("$i : ${projectPriceRangeScreenController.priceRangeList[i].priceRangeStatus}");
                            // }

                            await projectPriceRangeScreenController
                                .addPriceRangeFunction();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // border: Border.all(),
                              color: AppColors.blueColor,
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ).commonAllSidePadding(padding: 15),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    PriceRangeListModule(),

                    // Expanded(child: PriceRangeListModule()),
                  ],
                ),
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
