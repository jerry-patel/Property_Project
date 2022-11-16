import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/seller/controllers/add_property_video_screen_controller/add_property_video_screen_controller.dart';

import 'add_property_video_screen_widgets.dart';

class AddSellerPropertyVideoScreen extends StatelessWidget {
  AddSellerPropertyVideoScreen({Key? key}) : super(key: key);
  final addSellerPropertyVideoScreenController
  = Get.put(AddSellerPropertyVideoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addSellerPropertyVideoScreenController.projectTitle),
        centerTitle: true,
      ),

      body: Obx(
          ()=> addSellerPropertyVideoScreenController.isLoading.value
              ? const CustomCircularProgressIndicatorModule()
              : Column(
            children: [
              SellerPropertyVideoUploadModule(),
              SellerPropertyVideoShowModule(),
            ],
          ),
      ),

    );
  }
}
