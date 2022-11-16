import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/buyer/screens/sign_up_screen/sign_up_screen.dart';
import 'package:lebech_property/common/constants/app_colors.dart';
import 'package:lebech_property/common/field_decorations.dart';
import 'package:lebech_property/common/field_validations.dart';
import 'package:lebech_property/common_ui/screens/select_application_type_screen/select_application_type_screen.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';


class SignInPhoneNoTextFieldModule extends StatelessWidget {
  SignInPhoneNoTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.phoneNoTextField,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: signInFormFieldDecoration(hintText: 'Mobile No', controller: screenController),
      validator: (value) => FieldValidations().validateMobile(value!),
    );
  }
}

class SignInPasswordFieldModule extends StatelessWidget {
  SignInPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => TextFormField(
          controller: screenController.passwordTextField,
          keyboardType: TextInputType.text,
          obscureText: screenController.isPasswordShow.value,
          decoration: signInFormFieldDecoration(hintText: 'Password', index: 1, controller: screenController),
          validator: (value) => FieldValidations().validatePassword(value!),
        )
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.signInFormKey.currentState!.validate()){
          await screenController.userSignInFunction();

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
              'SIGN IN',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordModule extends StatelessWidget {
  const ForgotPasswordModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
            'FORGOTTEN YOUR PASSWORD?'
        ),
      ),
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  const SignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('New User? '),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignUpScreen());
          },
          child: const Text(
            'SignUp',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.greenColor
            ),
          ),
        ),
      ],
    );
  }
}

class OtherLoginTextModule extends StatelessWidget {
  const OtherLoginTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.offAll(()=> SelectApplicationTypeScreen());
          },
          child: const Text(
            'Other Login',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.greenColor
            ),
          ),
        ),
      ],
    );
  }
}
