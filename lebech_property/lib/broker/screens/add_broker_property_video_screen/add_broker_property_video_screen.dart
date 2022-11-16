import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/add_broker_property_video_screen_controller/add_broker_property_video_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';

import 'add_broker_property_video_screen_widgets.dart';

class AddBrokerPropertyVideoScreen extends StatelessWidget {
  AddBrokerPropertyVideoScreen({Key? key}) : super(key: key);
  final addBrokerPropertyVideoScreenController
  = Get.put(AddBrokerPropertyVideoScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addBrokerPropertyVideoScreenController.projectTitle),
        centerTitle: true,
      ),

      body: Obx(
            ()=> addBrokerPropertyVideoScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
          children: [
            BrokerPropertyVideoUploadModule(),
            BrokerPropertyVideoShowModule(),
          ],
        ),
      ),

    );
  }
}
