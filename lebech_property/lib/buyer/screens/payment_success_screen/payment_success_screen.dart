import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/screens/home_screen/home_screen.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/extension_methods/extension_methods.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Center(
                  child: Icon(Icons.check, color: Colors.white, size: 45),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Your payment was Successful, Our team is working on it. We will provide you your contact detail soon!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ).commonAllSidePadding(padding: 15),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Get.offAll(
                    () => HomeScreen(),
                    transition: Transition.zoom,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.blueColor,
                  ),
                  child: const Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).commonSymmetricPadding(horizontal: 24, vertical: 14),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
