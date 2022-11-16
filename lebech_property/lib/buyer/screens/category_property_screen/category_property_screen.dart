import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/category_wise_property_model/category_wise_property_model.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import '../../controllers/category_property_screen_controller/category_property_screen_controller.dart';
import 'category_property_screen_widgets.dart';

class CategoryPropertyScreen extends StatelessWidget {
  CategoryPropertyScreen({Key? key}) : super(key: key);
  final categoryPropertyScreenController =
      Get.put(CategoryPropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: categoryPropertyScreenController.subCategoryList[0].category!.name),
      body: Obx(() => categoryPropertyScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : Column(
              children: [
                CPSSubCategoryTypeDropDownModule(),
                const SizedBox(height: 10),
                CPSPropertyTypeDropDownModule(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FindSubCategoryButtonModule(),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: categoryPropertyScreenController.categoryPropertyList.isEmpty
                      ? const Center(
                          child: Text(
                            "No Property Found",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : GridView.builder(
                          itemCount: categoryPropertyScreenController
                              .categoryPropertyList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1 / 2.1,
                          ),
                          itemBuilder: (context, i) {
                            CategoryWiseDatum singleProperty =
                                categoryPropertyScreenController
                                    .categoryPropertyList[i];
                            return CategoryListTile(
                                singleProperty: singleProperty);
                          },
                        ),
                ),
              ],
            ).commonAllSidePadding(padding: 10)),
    );
  }
}
