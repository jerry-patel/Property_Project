import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_create_property_screen_controller/builder_create_property_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/enums.dart';

import 'builder_create_property_screen_widgets.dart';

class BuilderCreatePropertyScreen extends StatelessWidget {
  BuilderCreatePropertyScreen({Key? key}) : super(key: key);
  final builderCreatePropertyScreenController = Get.put(BuilderCreatePropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            builderCreatePropertyScreenController.propertyGenerate == PropertyGenerate.create
            ? 'Create Property'
        : 'Update Property'),
      ),

      body: Obx(
            () => builderCreatePropertyScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
          child: Form(
            key: builderCreatePropertyScreenController.formKey,
            child: Column(
              children: [
                BCPPropertyDetailsModule(),
                BCPTenantDetailsModule(),
                BCPOwnerDetailsModule(),

                const SizedBox(height: 10),
                BuilderSaveButtonModule(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
