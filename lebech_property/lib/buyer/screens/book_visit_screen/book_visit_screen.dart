import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import '../../controllers/book_visit_screen_controller/book_visit_screen_controller.dart';
import 'book_visit_screen_widgets.dart';

class BookVisitScreen extends StatelessWidget {
  BookVisitScreen({Key? key}) : super(key: key);
  final bookVisitScreenController = Get.put(BookVisitScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Book Visit"),
      body: Obx(
        () => bookVisitScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
                children: [
                  BookVisitPropertyDetailsModule(),
                  const SizedBox(height: 10),

                  BranchDropdownModule(),
                  const SizedBox(height: 10),
                  TimeSlotDropdownModule(),
                  const SizedBox(height: 20),
                  BookButtonModule(),
                ],
              ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
