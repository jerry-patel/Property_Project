import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';
import '../../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import '../sign_in_screen/sign_in_screen.dart';

class FullNameTextFieldModule extends StatelessWidget {
  FullNameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.fullNameTextField,
      keyboardType: TextInputType.text,
      decoration: signUpFormFieldDecoration(hintText: 'Full Name', controller: screenController),
      validator: (value) => FieldValidations().validateFullName(value!),
    );
  }
}

class MobileNoTextFieldModule extends StatelessWidget {
  MobileNoTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.mobileNoTextField,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: signUpFormFieldDecoration(hintText: '10 Digit Mobile Number', controller: screenController),
      validator: (value) => FieldValidations().validateMobile(value!),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailTextField,
      keyboardType: TextInputType.emailAddress,
      decoration: signUpFormFieldDecoration(hintText: 'Email Address', controller: screenController),
      validator: (value) => FieldValidations().validateEmail(value!),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  PasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: screenController.passwordTextField,
          keyboardType: TextInputType.text,
          obscureText: screenController.isPasswordShow.value,
          decoration: signUpFormFieldDecoration(
              hintText: 'Password', index: 1, controller: screenController),
          validator: (value) => FieldValidations().validatePassword(value!),
        ));
  }
}

class ConfirmPasswordFieldModule extends StatelessWidget {
  ConfirmPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: screenController.cPasswordTextField,
          keyboardType: TextInputType.text,
          obscureText: screenController.isCPasswordShow.value,
          decoration: signUpFormFieldDecoration(
              hintText: 'Confirm Password',
              index: 2,
              controller: screenController),
          validator: (value) => FieldValidations().validateCPassword(
            value!,
            screenController.passwordTextField.text.trim(),
            screenController.cPasswordTextField.text.trim(),
          ),
        ));
  }
}

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an Account? ',
          style: TextStyle(
              fontSize: 16
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignInScreen());
          },
          child: const Text(
            'SingIn',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CreateAccountButtonModule extends StatelessWidget {
  CreateAccountButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.signUpFormKey.currentState!.validate()){
          await screenController.getUserSignUpFunction();
        }
      },
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'CREATE ACCOUNT',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

