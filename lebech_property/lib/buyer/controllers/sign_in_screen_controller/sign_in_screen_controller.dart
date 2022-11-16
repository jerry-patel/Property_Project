import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/broker/screens/broker_home_screen/broker_home_screen.dart';
import 'package:lebech_property/builder/screens/builder_home_screen/builder_home_screen.dart';
import 'package:lebech_property/buyer/models/sign_in_model/sign_in_model.dart';
import 'package:lebech_property/buyer/screens/home_screen/home_screen.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/constants/enums.dart';
import 'package:lebech_property/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/screens/seller_home_screen/seller_home_screen.dart';

class SignInScreenController extends GetxController {
  /// SignIn Type normal or backScreen
  SignInRouteType signInRouteType = Get.arguments ?? SignInRouteType.normal;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordShow = true.obs;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final phoneNoTextField = TextEditingController();
  final passwordTextField = TextEditingController();
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  String applicationType = "";

  Future<void> userSignInFunction() async {
    isLoading(true);
    String url = getLoginUrl();
    log('url : $url');

    try{
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['mobile'] = phoneNoTextField.text.trim().toLowerCase();
      request.fields['password'] = passwordTextField.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        SignInModel signInModel = SignInModel.fromJson(json.decode(value));
        isSuccessStatus = signInModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: 'User loggedIn successfully!');
          String userToken = signInModel.data.token;
          await sharedPreferenceData.setUserLoggedInDetailsInPrefs(userToken: userToken);
          await sharedPreferenceData.setCurrentCityInPrefs(cityId: "1");

          if(UserDetails.applicationType == "buyer") {
            if (signInRouteType == SignInRouteType.normal) {
              Get.offAll(() => HomeScreen());
            } else if (signInRouteType == SignInRouteType.backScreen) {
              Get.back();
            }
          } else if(UserDetails.applicationType == "seller") {
            Get.offAll(()=> SellerHomeScreen(), transition: Transition.zoom);
          } else if(UserDetails.applicationType == "broker") {
            Get.offAll(()=> BrokerHomeScreen(), transition: Transition.zoom);
          } else if(UserDetails.applicationType == "builder") {
            Get.offAll(()=> BuilderHomeScreen(), transition: Transition.zoom);
          }

        } else {
          Fluttertoast.showToast(msg: 'User loggedIn failed!');
        }

      });

    } catch(e) {
      log('userSignInFunction Error1 : $e');
    } finally {
      isLoading(false);
    }
  }


  String getLoginUrl() {
    if(UserDetails.applicationType == "buyer") {
      return ApiUrl.loginApi;
    } else if(UserDetails.applicationType == "seller") {
      return ApiUrl.sellerLoginApi;
    } else if(UserDetails.applicationType == "broker") {
      return ApiUrl.brokerLoginApi;
    } else if(UserDetails.applicationType == "builder") {
      return ApiUrl.builderLoginApi;
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