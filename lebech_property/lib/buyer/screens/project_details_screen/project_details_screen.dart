import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/project_details_screen_controller/project_details_screen_controller.dart';
import 'project_details_screen_widgets.dart';

class ProjectDetailsScreen extends StatelessWidget {
  ProjectDetailsScreen({Key? key}) : super(key: key);
  final projectDetailsScreenController =
      Get.put(ProjectDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Details"),
      body: Obx(
        () => projectDetailsScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesSliderModule(),
                    const SizedBox(height: 5),
                    ImagesSliderIndicatorModule(),
                    const SizedBox(height: 10),
                    PropertyTitleAndAreaModule(),
                    // const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    PriceDetailsModule(),
                    // const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    WhyQuestionModule(),
                    // const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    AminitiesModule(),
                    const Divider(thickness: 1),
                    NearByTextModule(),
                    const Divider(thickness: 1),
                    projectDetailsScreenController.videoAvailable == true ? VideoGalleryModule() : Container(),
                    projectDetailsScreenController.videoAvailable == true ? const Divider(thickness: 1) : Container(),
                    BrochuresModule(),
                    const Divider(thickness: 1),
                    /// Import from other Common
                    SocialMediaIconsModule(),
                  ],
                ),
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
