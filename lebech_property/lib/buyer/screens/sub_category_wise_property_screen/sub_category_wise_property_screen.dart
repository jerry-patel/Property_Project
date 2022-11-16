import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/sub_category_wise_property_screen_controller/sub_category_wise_property_screen_controller.dart';
import '../../models/sub_category_wise_property_model/sub_category_wise_property_model.dart';
import 'sub_category_wise_property_screen_widgets.dart';

class SubCategoryWisePropertyScreen extends StatelessWidget {
  SubCategoryWisePropertyScreen({Key? key}) : super(key: key);
  final subCategoryWisePropertyScreenController =
      Get.put(SubCategoryWisePropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Sub Category'),
      body: Column(
        children: [
          SCWPPropertyTypeDropDownModule(),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => subCategoryWisePropertyScreenController.isLoading.value
                  ? const CustomCircularProgressIndicatorModule()
                  : GridView.builder(
                      itemCount: subCategoryWisePropertyScreenController
                          .subCategoryWisePropertyList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 2.1,
                      ),
                      itemBuilder: (context, i) {
                        Datum singleItem = subCategoryWisePropertyScreenController.subCategoryWisePropertyList[i];
                        return SubCategoryListTile(singleItem: singleItem);
                      },
                    ),
            ),
          ),
        ],
      ).commonAllSidePadding(padding: 10),
    );
  }
}
