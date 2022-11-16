import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/controllers/builder_property_yt_link_screen_controller/builder_property_yt_link_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import 'builder_property_yt_link_screen_widgets.dart';

class BuilderPropertyYoutubeLinkScreen extends StatelessWidget {
  BuilderPropertyYoutubeLinkScreen({Key? key}) : super(key: key);
  final builderPropertyYoutubeLinkScreenController =
      Get.put(BuilderPropertyYoutubeLinkScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(builderPropertyYoutubeLinkScreenController.title),
        centerTitle: true,
      ),
      body: Obx(
        () => builderPropertyYoutubeLinkScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Column(
                  children: [
                    ProjectVideoUploadModule(),
                    const SizedBox(height: 10),

                    Expanded(child: ProjectVideoLinkListModule()),

                  ],
                ).commonAllSidePadding(padding: 10),

      ),
    );
  }
}
