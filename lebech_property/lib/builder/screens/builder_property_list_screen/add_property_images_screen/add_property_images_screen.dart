import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/add_property_images_screen_controller/add_property_images_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'add_property_images_screen_widgets.dart';

class AddBuilderPropertyImagesScreen extends StatelessWidget {
  AddBuilderPropertyImagesScreen({Key? key}) : super(key: key);
  final addBuilderPropertyImagesScreenController =
      Get.put(AddBuilderPropertyImagesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Images"),
      ),
      body: Obx(
        () => addBuilderPropertyImagesScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    /// Property Image upload Module
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          BuilderPropertyImageUploadModule(),
                          const SizedBox(height: 10),
                          addBuilderPropertyImagesScreenController.apiImagesList.isEmpty
                              ? const Center(
                            child: Text(
                              "No Property Images Available!",
                            ),
                          )
                              : BuilderImagesGridViewModule()
                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),

                    const SizedBox(height: 10),

                    /// Property Video Upload Module
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          BuilderPropertyVideoUploadModule(),
                          BuilderPropertyVideoShowModule(),
                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),

                    const SizedBox(height: 10),

                    /// Property Yt Link Upload Module
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          ProjectVideoUploadModule(),
                          const SizedBox(height: 10),
                          ProjectVideoLinkListModule(),
                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),

                  ],
                ).commonAllSidePadding(padding: 5),
              ),
      ),
    );
  }
}
