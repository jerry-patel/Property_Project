import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_create_project_screen_controller/builder_create_project_screen_controller.dart';
import 'package:lebech_property/common/common_functions.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'builder_create_project_screen_widgets.dart';

class BuilderCreateProjectScreen extends StatelessWidget {
  BuilderCreateProjectScreen({Key? key}) : super(key: key);
  final builderCreateProjectScreenController
  = Get.put(BuilderCreateProjectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            builderCreateProjectScreenController.propertyGenerate == PropertyGenerate.create
            ? 'Create Project'
        : 'Update Project'),
      ),

      body: Obx(
          ()=> builderCreateProjectScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : SingleChildScrollView(
            child: GestureDetector(
              onTap: ()=> hideKeyBoard(),
              child: Form(
                key: builderCreateProjectScreenController.formKey,
                child: Column(
                  children: [
                    // Name Field
                    ProjectNameFieldModule(),
                    // City & Area
                    ProjectCityDropDownModule(),
                    ProjectAreaDropDownModule(),
                    // Category
                    ProjectCategoryDropDownModule(),

                    // Price Range
                    // PriceRangeModule(),
                    // Add Near By
                    // AddNearbyModule(),

                    // Quill Fields
                    // WhyConsiderProjectFieldModule(),
                    MoreAboutProjectFieldModule(),
                    AboutBuilderFieldModule(),

                    // Yt Link
                    // YouTubeLinkModule(),

                    // Facility Checkbox
                    FacilitiesGridViewModule(),

                    ProjectAddressFieldModule(),
                    ProjectOfficeAddressFieldModule(),
                    ProjectPhoneNoFieldModule(),
                    ProjectEmailFieldModule(),

                    const SizedBox(height: 20),
                    ProjectSaveButton(),
                    const SizedBox(height: 20),
                  ],
                ).commonAllSidePadding(padding: 10),
              ),
            ),
          ),
      ),

    );
  }
}
