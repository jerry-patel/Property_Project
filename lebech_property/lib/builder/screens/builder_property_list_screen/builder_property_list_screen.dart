import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_property_list_screen_controller/builder_property_list_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';

import 'builder_property_list_screen_widgets.dart';

class BuilderPropertyListScreen extends StatelessWidget {
  BuilderPropertyListScreen({Key? key}) : super(key: key);
  final builderPropertyListScreenController
  = Get.put(BuilderPropertyListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Property List'),
      ),

      body: Obx(
          ()=> builderPropertyListScreenController.isLoading.value
              ? const CustomCircularProgressIndicatorModule()
              : builderPropertyListScreenController.builderPropertyList.isEmpty
              ? const Center(child: Text("No Data Available"))
              : BuilderPropertyListModule(),
      ),

    );
  }
}
