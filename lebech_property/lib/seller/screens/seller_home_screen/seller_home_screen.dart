import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/custom_drawer/seller_drawer/seller_drawer.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';
import 'package:lebech_property/seller/screens/seller_home_screen/seller_home_screen_widgets.dart';

class SellerHomeScreen extends StatelessWidget {
  SellerHomeScreen({Key? key}) : super(key: key);
  final sellerHomeScreenController = Get.put(SellerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lebech Property'),
      ),
      drawer: SellerDrawer(),
      body: Obx(() => sellerHomeScreenController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : sellerHomeScreenController.sellerPropertyList.isEmpty
              ? const Center(child: Text("No Data Available"))
              : SellerPropertyListModule(),
      ),
    );
  }
}
