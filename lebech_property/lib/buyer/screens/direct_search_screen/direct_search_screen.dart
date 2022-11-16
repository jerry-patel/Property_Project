import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import '../../controllers/direct_search_screen_controller/direct_search_screen_controller.dart';
import 'direct_search_screen_widgets.dart';

class DirectSearchScreen extends StatelessWidget {
  DirectSearchScreen({Key? key}) : super(key: key);
  final directSearchScreenController = Get.put(DirectSearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DSSPropertyTypeDropDownModule(),
            const SizedBox(height: 10),
            DirectSearchScreenSearchFieldModule(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => directSearchScreenController.isLoading.value
                  ? const CustomCircularProgressIndicatorModule()
                  : directSearchScreenController.directSearchList.isEmpty
                  ? const Center(
                child: Text(
                  "Search Property",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : DirectSearchListModule()),
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
