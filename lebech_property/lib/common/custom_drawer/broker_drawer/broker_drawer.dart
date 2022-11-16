import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/broker/controllers/broker_home_screen_controller/broker_home_screen_controller.dart';
import 'package:lebech_property/broker/screens/broker_create_property_screen/broker_create_property_screen.dart';
import 'package:lebech_property/broker/screens/broker_drawer_controller/broker_drawer_controller.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

class BrokerDrawer extends StatelessWidget {
  BrokerDrawer({Key? key}) : super(key: key);
  final brokerDrawerController = Get.put(BrokerDrawerController());
  final brokerHomeScreenController = Get.find<BrokerHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => brokerDrawerController.isLoading.value
          ? const CustomCircularProgressIndicatorModule()
          : Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // homeModule(),
                    // profileModule(),
                    createPropertyModule(),
                    // propertyListModule(),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              brokerDrawerController.isLoggedIn.value
                  ? signOutButton()
                  : signInButton(),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }


  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(
              () => SignInScreen(),
          transition: Transition.leftToRight,
        );
      },
      child: Obx(
            () => brokerDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Row(
          children: const [
            Icon(Icons.login_rounded, size: 25),
            SizedBox(width: 10),
            Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }

  Widget createPropertyModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> BrokerCreatePropertyScreen(), transition: Transition.leftToRight,
        arguments: [
          PropertyGenerate.create,
          0
        ])!
            .then((value) async {
          await brokerHomeScreenController
              .getBrokerAllPropertyFunction();
        });
      },
      leading: const Icon(Icons.home_rounded),
      title: const Text(
        "Create Property",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget signOutButton() {
    return GestureDetector(
      onTap: () {
        brokerDrawerController.userLoggedOutFunction();
      },
      child: Obx(
            () => brokerDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Row(
          children: const [
            Icon(Icons.logout_rounded, size: 25),
            SizedBox(width: 10),
            Text(
              "Sign Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }

}
