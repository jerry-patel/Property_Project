import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_appbar/custom_appbar.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

import '../../controllers/checkout_screen_controller/checkout_screen_controller.dart';
import 'checkout_screen_widgets.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final checkoutScreenController = Get.put(CheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Checkout"),
      body: Obx(() => checkoutScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : Column(
              children: [
                ImageModule(),
                const Divider(thickness: 1),

                CartModule(),
                const SizedBox(height: 20),
                BuyButtonModule(),
              ],
            ).commonAllSidePadding(padding: 10),
      ),
    );
  }
}
