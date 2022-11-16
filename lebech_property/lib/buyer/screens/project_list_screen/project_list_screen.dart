import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import '../../controllers/project_list_screen_controller/project_list_screen_controller.dart';
import 'project_list_screen_widgets.dart';

class ProjectListScreen extends StatelessWidget {
  final String? appBarHeading;
  ProjectListScreen({Key? key, this.appBarHeading}) : super(key: key);
  final projectListScreenController = Get.put(ProjectListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: appBarHeading ?? "Projects"),

      // backgroundColor: Colors.grey,

      body: Obx(
          ()=> projectListScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : PropertyListModule().commonAllSidePadding(padding: 10)
      ),
    );
  }
}
