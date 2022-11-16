import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/broker/screens/broker_home_screen/broker_home_screen.dart';
import 'package:lebech_property/builder/screens/builder_home_screen/builder_home_screen.dart';
import 'package:lebech_property/buyer/models/sign_up_model/sign_up_model.dart';
import 'package:lebech_property/buyer/screens/home_screen/home_screen.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/screens/seller_home_screen/seller_home_screen.dart';


class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordShow = true.obs;
  RxBool isCPasswordShow = true.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
  String applicationType = "";

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final fullNameTextField = TextEditingController();
  final mobileNoTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  final cPasswordTextField = TextEditingController();

  getUserSignUpFunction() async {
    isLoading(true);
    String url = getSignUpUrl();
    log('url : $url');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['name'] = fullNameTextField.text.trim();
      request.fields['mobile'] = mobileNoTextField.text.trim();
      request.fields['email'] = emailTextField.text.toLowerCase().trim();
      request.fields['password'] = passwordTextField.text.trim();
      request.fields['password_confirmation'] = cPasswordTextField.text.trim();

      var response = await request.send();
      log("response : $response");

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value : $value");
        SignUpModel signUpModel = SignUpModel.fromJson(json.decode(value));
        isSuccessStatus = signUpModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: 'User Created Successfully!');
          String userToken = signUpModel.data.token;
          await sharedPreferenceData.setUserLoggedInDetailsInPrefs(userToken: userToken);
          await sharedPreferenceData.setCurrentCityInPrefs(cityId: "1");

          if(UserDetails.applicationType == "buyer") {
            Get.offAll(()=> HomeScreen());
          }
          else if(UserDetails.applicationType == "seller") {
              Get.offAll(()=> SellerHomeScreen());
          }
          else if(UserDetails.applicationType == "broker") {
            Get.offAll(()=> BrokerHomeScreen());
          }
          else if(UserDetails.applicationType == "builder") {
            Get.offAll(()=> BuilderHomeScreen());
          }

        } else {
          Fluttertoast.showToast(msg: 'User Not Created Successfully!');
        }

      });

    } catch(e) {
      log('getUserSignUpFunction Error : $e');
    } finally {
      isLoading(false);
    }
  }


  String getSignUpUrl() {
    if(UserDetails.applicationType == "buyer") {
      return ApiUrl.registerApi;
    } else if(UserDetails.applicationType == "seller") {
      return ApiUrl.sellerRegisterApi;
    } else if(UserDetails.applicationType == "broker") {
      return ApiUrl.brokerRegisterApi;
    } else if(UserDetails.applicationType == "builder") {
      return ApiUrl.builderRegisterApi;
    }
    return "";
  }

  @override
  void onInit() {
    applicationTypeFunction();
    super.onInit();
  }

  applicationTypeFunction() async {
    isLoading(true);
    applicationType = await sharedPreferenceData.getApplicationType();
    isLoading(false);
  }

}