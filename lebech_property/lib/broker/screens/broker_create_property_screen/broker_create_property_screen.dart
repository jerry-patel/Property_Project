import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/broker_create_property_screen_controller/broker_create_property_screen_controller.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/enums.dart';

import 'broker_create_property_screen_widgets.dart';

class BrokerCreatePropertyScreen extends StatelessWidget {
  BrokerCreatePropertyScreen({Key? key}) : super(key: key);
  final brokerCreatePropertyScreenController
  = Get.put(BrokerCreatePropertyScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            brokerCreatePropertyScreenController.propertyGenerate == PropertyGenerate.create
            ? 'Create Property'
        : 'Update Property'),
      ),


      body: Obx(
            () => brokerCreatePropertyScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : SingleChildScrollView(
          child: Form(
            key: brokerCreatePropertyScreenController.formKey,
            child: Column(
              children: [
                BCPPropertyDetailsModule(),
                BCPTenantDetailsModule(),
                BCPOwnerDetailsModule(),

                const SizedBox(height: 10),
                BrokerSaveButtonModule(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
