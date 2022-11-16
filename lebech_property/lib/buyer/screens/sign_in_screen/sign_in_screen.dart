import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/common_functions.dart';
import 'package:lebech_property/common/common_widgets.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'sign_in_screen_widgets.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: signInScreenController.signInFormKey,
              child: Obx(
                () => signInScreenController.isLoading.value
                    ? const CustomCircularProgressIndicatorModule()
                    : Container(
                        alignment: Alignment.center,
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
                                    FormMainHeaderModule(text: 'Sign In To ${signInScreenController.applicationType} Account'),
                                    // const SizedBox(height: 10),
                                    // const FormMainHeaderModule(
                                    //     text: 'To Your Account'),
                                    // const SizedBox(height: 15),
                                    // const FormSubHeaderModule(
                                    //     text:
                                    //         'Lorem ipsum dolor, sit amet consectetur adipisicing elit. '
                                    //         'Sit aliquid, Non distinctio vel iste.'),
                                    const SizedBox(height: 30),
                                    SignInPhoneNoTextFieldModule(),
                                    const SizedBox(height: 10),
                                    SignInPasswordFieldModule(),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            const ForgotPasswordModule(),
                            const SizedBox(height: 30),
                            SignInButtonModule(),
                            const SizedBox(height: 30),
                            const SignUpTextModule(),
                            const SizedBox(height: 15),
                            OtherLoginTextModule(),
                            const SizedBox(height: 30),
                          ],
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
