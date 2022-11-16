import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/add_builder_property_video_screen_controller/add_builder_property_video_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';

import 'add_builder_property_video_screen_widgets.dart';

class AddBuilderPropertyVideoScreen extends StatelessWidget {
  AddBuilderPropertyVideoScreen({Key? key}) : super(key: key);
  final addBuilderPropertyVideoScreenController
  = Get.put(AddBuilderPropertyVideoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addBuilderPropertyVideoScreenController.projectTitle),
        centerTitle: true,
      ),

      body: Obx(
            ()=> addBuilderPropertyVideoScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
          children: [
            BuilderPropertyVideoUploadModule(),
            BuilderPropertyVideoShowModule(),
          ],
        ),
      ),

    );
  }
}
