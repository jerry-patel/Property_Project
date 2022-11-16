import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_near_by_screen_controller/project_near_by_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'project_near_by_screen_widgets.dart';

class ProjectNearByScreen extends StatelessWidget {
  ProjectNearByScreen({Key? key}) : super(key: key);
  final projectNearByScreenController = Get.put(ProjectNearByScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(projectNearByScreenController.title),
        centerTitle: true,
      ),

      body: Obx(
            () => projectNearByScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Header2(text: "Near By"),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        projectNearByScreenController.isLoading(true);

                        TextEditingController nearByTextController = TextEditingController();
                        TextEditingController nearByTravelTimeController = TextEditingController();
                        List<bool> nearByStatusList = [true, false];

                        int iNumber = projectNearByScreenController.nearByList.length;
                        // int indexNumber = iNumber+1;

                        projectNearByScreenController.nearByTextControllerList.add(nearByTextController);
                        projectNearByScreenController.nearByTravelTimeControllerList.add(nearByTravelTimeController);
                        projectNearByScreenController.nearByStatusMainList.add(nearByStatusList);
                        projectNearByScreenController.nearByStatusList.add(false);

                        projectNearByScreenController.nearByList.add(
                          AddNearBySingleModule(
                            nearByController: projectNearByScreenController.nearByTextControllerList[iNumber],
                            nearByTravelTimeController: projectNearByScreenController.nearByTravelTimeControllerList[iNumber],
                            nearByStatusList: projectNearByScreenController.nearByStatusMainList[iNumber],
                            nearByStatus: projectNearByScreenController.nearByStatusList[iNumber],
                            index: iNumber,
                          ),
                        );
                        projectNearByScreenController.isLoading(false);
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
                itemCount: projectNearByScreenController
                    .nearByList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return projectNearByScreenController
                      .nearByList[i];
                },
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await projectNearByScreenController
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

              NearByListModule(),

              // Expanded(child: PriceRangeListModule()),
            ],
          ),
        ).commonAllSidePadding(padding: 10),
      ),

    );
  }
}
