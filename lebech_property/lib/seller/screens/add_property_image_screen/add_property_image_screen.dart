import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/add_property_image_screen_controller/add_property_image_screen_controller.dart';

import 'add_property_image_screen_widgets.dart';

class AddPropertyImageScreen extends StatelessWidget {
  AddPropertyImageScreen({Key? key}) : super(key: key);
  final addPropertyImageScreenController =
      Get.put(AddPropertyImageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addPropertyImageScreenController.propertyTitle),
        centerTitle: true,
      ),
      body: Obx(
        () => addPropertyImageScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          ImageUploadModule(),
                          const SizedBox(height: 10),
                          addPropertyImageScreenController.apiImagesList.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No Property Images Available!",
                                  ),
                                )
                              : ImagesGridViewModule(),
                        ],
                      ).commonAllSidePadding(padding: 10),
                    ),

                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          SellerPropertyVideoUploadModule(),
                          SellerPropertyVideoShowModule(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),

                      child: Column(
                        children: [
                          SellerProjectVideoUploadModule(),
                          const SizedBox(height: 10),
                          SellerProjectVideoLinkListModule(),
                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),

                  ],
                ).commonAllSidePadding(padding: 10),
              ),
      ),
    );
  }
}
