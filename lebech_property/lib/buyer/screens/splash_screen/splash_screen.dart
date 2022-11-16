import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import '../../controllers/splash_screen_controller/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "LeBech  Property",
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ),
    );
  }
}
