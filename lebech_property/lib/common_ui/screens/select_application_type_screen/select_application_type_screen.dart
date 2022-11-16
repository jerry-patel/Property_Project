import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/screens/home_screen/home_screen.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';
import 'package:lebech_property/common_ui/controllers/select_application_type_screen_controller/select_application_type_screen_controller.dart';

class SelectApplicationTypeScreen extends StatelessWidget {
  SelectApplicationTypeScreen({Key? key}) : super(key: key);
  final selectApplicationTypeScreenController =
      Get.put(SelectApplicationTypeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => selectApplicationTypeScreenController.isLoading.value
            ? const CustomCircularProgressIndicatorModule()
            : Container(
                color: AppColors.blueColor,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),

                      /// Buyer
                      ListTile(
                        title: const Text(
                            'Buyer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Radio<ApplicationType>(
                          value: ApplicationType.buyer,
                          groupValue: selectApplicationTypeScreenController
                              .applicationType,
                          onChanged: (value) {
                            selectApplicationTypeScreenController
                                .isLoading(true);
                            selectApplicationTypeScreenController
                                .applicationType = value!;
                            log("value : ${selectApplicationTypeScreenController.applicationType}");
                            selectApplicationTypeScreenController
                                .isLoading(false);
                          },
                          activeColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                        ),
                      ),

                      /// Seller
                      ListTile(
                        title: const Text('Seller',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        leading: Radio<ApplicationType>(
                          value: ApplicationType.seller,
                          groupValue: selectApplicationTypeScreenController
                              .applicationType,
                          onChanged: (value) {
                            selectApplicationTypeScreenController
                                .isLoading(true);
                            selectApplicationTypeScreenController
                                .applicationType = value!;
                            log("value : ${selectApplicationTypeScreenController.applicationType}");
                            selectApplicationTypeScreenController
                                .isLoading(false);
                          },
                          activeColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                        ),
                      ),

                      /// Broker
                      ListTile(
                        title: const Text('Broker',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        leading: Radio<ApplicationType>(
                          value: ApplicationType.broker,
                          groupValue: selectApplicationTypeScreenController
                              .applicationType,
                          onChanged: (value) {
                            selectApplicationTypeScreenController
                                .isLoading(true);
                            selectApplicationTypeScreenController
                                .applicationType = value!;
                            log("value : ${selectApplicationTypeScreenController.applicationType}");
                            selectApplicationTypeScreenController
                                .isLoading(false);
                          },
                          activeColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                        ),
                      ),

                      /// Builder
                      ListTile(
                        title: const Text('Builder',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        leading: Radio<ApplicationType>(
                          value: ApplicationType.builder,
                          groupValue: selectApplicationTypeScreenController
                              .applicationType,
                          onChanged: (value) {
                            selectApplicationTypeScreenController
                                .isLoading(true);
                            selectApplicationTypeScreenController
                                .applicationType = value!;
                            log("value : ${selectApplicationTypeScreenController.applicationType}");
                            selectApplicationTypeScreenController
                                .isLoading(false);
                          },
                          activeColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                        ),
                      ),

                      // const SizedBox(height: 10),
                      const Spacer(),

                      GestureDetector(
                        onTap: () async {
                          String typeSelected = "";
                          if(selectApplicationTypeScreenController.applicationType == ApplicationType.buyer) {
                            typeSelected = "buyer";
                          } else if(selectApplicationTypeScreenController.applicationType == ApplicationType.seller) {
                            typeSelected = "seller";
                          } else if(selectApplicationTypeScreenController.applicationType == ApplicationType.broker) {
                            typeSelected = "broker";
                          } else if(selectApplicationTypeScreenController.applicationType == ApplicationType.builder) {
                            typeSelected = "builder";
                          }

                          /// Set Application Type in Prefs
                          await selectApplicationTypeScreenController.
                          sharedPreferenceData.setApplicationType(
                              applicationType: typeSelected,
                          );

                          if(typeSelected == "buyer") {
                            Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
                          } else if(typeSelected == "seller") {
                            Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
                          } else if(typeSelected == "broker") {
                            Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
                          } else if(typeSelected == "builder") {
                            Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
                          }

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ).commonSymmetricPadding(horizontal: 20, vertical: 15),
                        ),
                      ),

                      const SizedBox(height: 30),

                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
