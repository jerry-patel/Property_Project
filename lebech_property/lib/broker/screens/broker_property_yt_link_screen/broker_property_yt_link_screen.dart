import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/broker_property_yt_link_screen_controller/broker_property_yt_link_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'broker_property_yt_link_screen_widgets.dart';

class BrokerPropertyYoutubeLinkScreen extends StatelessWidget {
  BrokerPropertyYoutubeLinkScreen({Key? key}) : super(key: key);
  final brokerPropertyYoutubeLinkScreenController
  = Get.put(BrokerPropertyYoutubeLinkScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brokerPropertyYoutubeLinkScreenController.title),
        centerTitle: true,
      ),

      body: Obx(
            () => brokerPropertyYoutubeLinkScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
          children: [
            BrokerPropertyVideoUploadModule(),
            const SizedBox(height: 10),

            Expanded(child: BrokerPropertyVideoLinkListModule()),

          ],
        ).commonAllSidePadding(padding: 10),

      ),

    );
  }
}
