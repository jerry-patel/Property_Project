import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_functions.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/search_screen_controller/search_screen_controller.dart';
import 'search_screen_widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final searchScreenController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Scaffold(
        appBar: customAppBar(title: "Search"),
        body: Obx(
            () => searchScreenController.isLoading.value
                ? const CustomCircularProgressIndicatorModule()
                : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SSPropertyTypeDropDownModule().commonAllSidePadding(padding: 10),
                SSPropertyStatusDropDownModule().commonAllSidePadding(padding: 10),
                /// Text Field & Button Module
                Row(
                  children: [
                    Expanded(child: SearchScreenSearchFieldModule()),
                    const SizedBox(width: 15),
                    FindButtonModule(),
                  ],
                ).commonSymmetricPadding(horizontal: 10),


                const SizedBox(height: 10),
                Expanded(
                  child: Obx(
                        () => searchScreenController.isLoading.value
                        ? const CustomCircularProgressIndicatorModule()
                        : searchScreenController.searchList.isEmpty
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
                        : SearchListModule()
                        .commonSymmetricPadding(horizontal: 10),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
