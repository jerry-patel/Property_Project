import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/controllers/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:lebech_property/buyer/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:lebech_property/buyer/screens/contact_list_screen/contact_list_screen.dart';
import 'package:lebech_property/buyer/screens/direct_search_screen/direct_search_screen.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/buyer/screens/visit_list_screen/visit_list_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'custom_drawer_widgets.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  CustomDrawerController customDrawerController = Get.put(CustomDrawerController());
  final homeScreenController = Get.find<HomeScreenController>();


  @override
  void initState() {
    customDrawerController.getUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => customDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const DrawerCategoryNameTextModule(),

                        // CategoryListModule(),

                        CategoryListModule(),

                        // ResidentialCategoryModule(),
                        // const CommercialCategoryModule(),
                        // const IndustrialCategoryModule(),
                        // const TextileSpaceCategoryModule(),


                        const ProjectsModule(),

                        const Divider(),

                        ListTile(
                          onTap: () {
                            Get.back();
                            Get.to(() => DirectSearchScreen());
                          },
                          title: const Text(
                            "Direct Search",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),

                        UserDetails.userLoggedIn
                        ? ListTile(
                          onTap: () {
                            Get.back();
                            Get.to(() => VisitListScreen());
                          },
                          title: const Text(
                            "Visits",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                        : Container(),

                        UserDetails.userLoggedIn
                            ? ListTile(
                          onTap: () {
                            Get.back();
                            Get.to(() => ContactListScreen());
                          },
                          title: const Text(
                            "Contacts",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                            : Container(),

                        const AboutUsModule(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                otherLoginButton(),
                const SizedBox(height: 20),

                customDrawerController.isLoggedIn.value
                    ? signOutButton()
                    : signInButton(),
                const SizedBox(height: 20),


              ],
            ),
          ),
        ),
    );
  }


  signInButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(
          () => SignInScreen(),
          transition: Transition.leftToRight,
        );
      },
      child: Obx(
        () => customDrawerController.isLoading.value
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

  signOutButton() {
    return GestureDetector(
      onTap: () {
        customDrawerController.userLoggedOutFunction();
      },
      child: Obx(
        () => customDrawerController.isLoading.value
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

  otherLoginButton() {
    return GestureDetector(
      onTap: () {
        customDrawerController.userLoggedOutFunction();
      },
      child: Obx(
            () => customDrawerController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Row(
          children: const [
            Icon(Icons.logout_rounded, size: 25),
            SizedBox(width: 10),
            Text(
              "Other Login",
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