import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/broker_home_screen_controller/broker_home_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_drawer/broker_drawer/broker_drawer.dart';

import 'broker_home_screen_widgets.dart';


class BrokerHomeScreen extends StatelessWidget {
  BrokerHomeScreen({Key? key}) : super(key: key);
  final brokerHomeScreenController = Get.put(BrokerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lebech Property'),
      ),

      drawer: BrokerDrawer(),

      body: Obx(() => brokerHomeScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : brokerHomeScreenController.brokerPropertyList.isEmpty
          ? const Center(child: Text("No Data Available"))
          : BrokerPropertyListModule(),
      ),

    );
  }
}
