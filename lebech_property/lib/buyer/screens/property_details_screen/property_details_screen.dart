import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';

import '../../controllers/property_details_screen_controller/property_details_screen_controller.dart';
import 'property_details_screen_widgets.dart';

class PropertyDetailsScreen extends StatelessWidget {
  PropertyDetailsScreen({Key? key}) : super(key: key);
  final propertyDetailsScreenController = Get.put(PropertyDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Property Details"),

      body: Obx(
          () => propertyDetailsScreenController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
              children: [
                PropertyImageSliderModule(),
                const SizedBox(height: 10),

                PropertyNameModule(),
                const SizedBox(height: 10),

                const PropertyDetailsModule(),
                const SizedBox(height: 10),

                FactNumbersModule(),
                const SizedBox(height: 10),

                AminitiesModule(),
                const SizedBox(height: 10),

                PropertyDetailsVideoGalleryModule(),
                const SizedBox(height: 10),

                FactsAndFeaturesModule(),
                const SizedBox(height: 10),

                /// Import from other Common
                SocialMediaIconsModule(),
              ],
            ),
          ),
      ),
    );
  }
}
