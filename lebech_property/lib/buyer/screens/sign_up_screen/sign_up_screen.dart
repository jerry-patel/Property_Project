import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_functions.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import '../../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'sign_up_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: signUpScreenController.signUpFormKey,
              child: Obx(
                    () => signUpScreenController.isLoading.value
                    ? const CustomCircularProgressIndicatorModule()
                    : Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.greenColor,
                            ),
                            child: Column(
                              children: [
                                FormMainHeaderModule(
                                    text: 'Register as ${signUpScreenController.applicationType}'),
                                // const SizedBox(height: 10),
                                // const FormMainHeaderModule(
                                //     text: 'Your Account'),
                                // const SizedBox(height: 15),
                                // const FormSubHeaderModule(
                                //     text:
                                //     'Lorem ipsum dolor, sit amet consectetur adipisicing elit. '
                                //         'Sit aliquid, Non distinctio vel iste.'),
                                const SizedBox(height: 30),
                                FullNameTextFieldModule(),
                                const SizedBox(height: 10),
                                MobileNoTextFieldModule(),
                                const SizedBox(height: 10),
                                EmailTextFieldModule(),
                                const SizedBox(height: 10),
                                PasswordFieldModule(),
                                const SizedBox(height: 10),
                                ConfirmPasswordFieldModule(),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CreateAccountButtonModule(),
                        const SizedBox(height: 30),
                        const AlreadyHaveAnAccountText(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
