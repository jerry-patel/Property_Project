import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/project_yt_link_screen_controller/project_yt_link_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'project_yt_link_screen_widgets.dart';

class ProjectYtLinkScreen extends StatelessWidget {
  ProjectYtLinkScreen({Key? key}) : super(key: key);

  final projectYtLinkScreenController =
      Get.put(ProjectYtLinkScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectYtLinkScreenController.title),
        centerTitle: true,
      ),
      body: Obx(
        () => projectYtLinkScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Header2(text: "Youtube Link"),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              projectYtLinkScreenController.isLoading(true);

                              TextEditingController ytLinkController1 =
                                  TextEditingController();
                              List<bool> ytLinkStatusList1 = [true, false];

                              int iNumber = projectYtLinkScreenController
                                  .ytLinkList.length;
                              // int indexNumber = iNumber+1;

                              projectYtLinkScreenController.ytLinkTextControllerList.add(ytLinkController1);
                              projectYtLinkScreenController.ytLinkStatusMainList.add(ytLinkStatusList1);
                              projectYtLinkScreenController.ytLinkStatusList.add(false);

                              projectYtLinkScreenController.ytLinkList.add(
                                YouTubeVideoLinkModule(
                                  ytLinkController:
                                      projectYtLinkScreenController
                                          .ytLinkTextControllerList[iNumber],
                                  ytLinkStatusList:
                                      projectYtLinkScreenController
                                          .ytLinkStatusMainList[iNumber],
                                  ytLinkStatus: projectYtLinkScreenController
                                      .ytLinkStatusList[iNumber],
                                  index: iNumber,
                                ),
                              );
                              projectYtLinkScreenController.isLoading(false);
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
                      itemCount:
                          projectYtLinkScreenController.ytLinkList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return projectYtLinkScreenController.ytLinkList[i];
                      },
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await projectYtLinkScreenController
                                .addProjectYtLinkFunction();
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

                    YtLinkListModule(),

                    // Expanded(child: PriceRangeListModule()),
                  ],
                ),
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
