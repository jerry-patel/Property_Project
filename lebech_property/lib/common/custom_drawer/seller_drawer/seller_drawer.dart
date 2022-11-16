import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/seller/controllers/seller_drawer_controller/seller_drawer_controller.dart';
import 'package:lebech_property/seller/controllers/seller_home_screen_controller/seller_home_screen_controller.dart';
import 'package:lebech_property/seller/screens/seller_create_property_screen/seller_create_property_screen.dart';


class SellerDrawer extends StatelessWidget {
  SellerDrawer({Key? key}) : super(key: key);
  final sellerDrawerController = Get.put(SellerDrawerController());
  final sellerHomeScreenController = Get.find<SellerHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => sellerDrawerController.isLoading.value
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
                    sellerDrawerController.isLoggedIn.value
                        ? signOutButton()
                        : signInButton(),
                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),
    );
  }

  Widget homeModule() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: const Icon(Icons.home_rounded),
      title: const Text(
        "Home",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

 /* Widget profileModule() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: const Icon(Icons.home_rounded),
      title: const Text(
        "Profile",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }*/

  Widget createPropertyModule() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> SellerCreatePropertyScreen(), transition: Transition.leftToRight,
        arguments: [
          PropertyGenerate.create,
          0
        ])!
            .then((value) async {
          await sellerHomeScreenController
              .getSellerAllPropertyFunction();
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

  /*Widget propertyListModule() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: const Icon(Icons.home_rounded),
      title: const Text(
        "Property List",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }*/


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
            () => sellerDrawerController.isLoading.value
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

  Widget signOutButton() {
    return GestureDetector(
      onTap: () {
        sellerDrawerController.userLoggedOutFunction();
      },
      child: Obx(
            () => sellerDrawerController.isLoading.value
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
