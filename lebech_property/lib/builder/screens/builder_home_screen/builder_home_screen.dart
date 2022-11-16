import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_home_screen_controller/builder_home_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_drawer/builder_drawer/builder_drawer.dart';

import 'builder_home_screen_widgets.dart';

class BuilderHomeScreen extends StatelessWidget {
  BuilderHomeScreen({Key? key}) : super(key: key);
  final builderHomeScreenController = Get.put(BuilderHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lebech Property'),
      ),
      drawer: BuilderDrawer(),


      body: Obx(() => builderHomeScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : builderHomeScreenController.builderProjectList.isEmpty
          ? const Center(child: Text("No Data Available"))
          : BuilderProjectListModule(),
      ),

    );
  }
}
