import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/add_other_project_screen_controller/add_other_project_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'add_other_project_screen_widgets.dart';

class AddOtherProjectScreen extends StatelessWidget {
  AddOtherProjectScreen({Key? key}) : super(key: key);
  final addOtherProjectScreenController =
      Get.put(AddOtherProjectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Project"),
        centerTitle: true,
      ),
      body: Obx(
        () => addOtherProjectScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
                child: Form(
                  key: addOtherProjectScreenController.formKey,
                  child: Column(
                    children: [
                      ProjectNameFieldModule(),
                      const SizedBox(height: 8),
                      ProjectImageModule(),
                      const SizedBox(height: 8),
                      ProjectAddressFieldModule(),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ProjectAddButton(),
                        ],
                      ),

                      const SizedBox(height: 15),

                      addOtherProjectScreenController.otherProjectsList.isEmpty
                      ? const Center(
                        child: Text(
                          "No Other Project Available!",
                        ),
                      )
                      : OtherProjectsListModule(),
                    ],
                  ),
                ),
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
