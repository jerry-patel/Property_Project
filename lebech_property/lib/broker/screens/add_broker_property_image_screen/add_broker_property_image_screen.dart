import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/add_broker_property_image_screen_controller/add_broker_property_image_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'add_broker_property_image_screen_widgets.dart';

class AddBrokerPropertyImageScreen extends StatelessWidget {
  AddBrokerPropertyImageScreen({Key? key}) : super(key: key);
  final addBrokerPropertyImageScreenController =
      Get.put(AddBrokerPropertyImageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addBrokerPropertyImageScreenController.propertyTitle),
        centerTitle: true,
      ),
      body: Obx(
        () => addBrokerPropertyImageScreenController.isLoading.value
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
                          PropertyImageUploadModule(),
                          const SizedBox(height: 10),
                          addBrokerPropertyImageScreenController.apiImagesList.isEmpty
                              ? const Center(
                            child: Text(
                              "No Property Images Available!",
                            ),
                          )
                              : BrokerImagesGridViewModule(),
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
                          BrokerPropertyVideoUploadModule(),
                          BrokerPropertyVideoShowModule(),
                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          BrokerPropertyYtLinkUploadModule(),
                          const SizedBox(height: 10),
                          BrokerPropertyVideoLinkListModule(),

                        ],
                      ).commonAllSidePadding(padding: 5),
                    ),



                  ],
                ),
              ),
      ),
    );
  }
}
