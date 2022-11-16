import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_property_yt_link_screen_controller/seller_property_yt_link_screen_controller.dart';

import 'seller_property_yt_link_screen_widgets.dart';

class SellerPropertyYoutubeLinkScreen extends StatelessWidget {
  SellerPropertyYoutubeLinkScreen({Key? key}) : super(key: key);
  final sellerPropertyYoutubeLinkScreenController =
      Get.put(SellerPropertyYoutubeLinkScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sellerPropertyYoutubeLinkScreenController.propertyTitle),
          centerTitle: true,
        ),
        body: Obx(
          () => sellerPropertyYoutubeLinkScreenController.isLoading.value
              ? const CustomCircularProgressIndicatorModule()
              : Column(
                  children: [
                    SellerProjectVideoUploadModule(),
                    const SizedBox(height: 10),
                    Expanded(child: SellerProjectVideoLinkListModule()),
                  ],
                ).commonAllSidePadding(padding: 10),
        ));
  }
}
