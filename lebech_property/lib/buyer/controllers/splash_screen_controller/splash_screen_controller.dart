import 'package:get/get.dart';
import 'package:lebech_property/broker/screens/broker_home_screen/broker_home_screen.dart';
import 'package:lebech_property/builder/screens/builder_home_screen/builder_home_screen.dart';
import 'package:lebech_property/buyer/screens/home_screen/home_screen.dart';
import 'package:lebech_property/buyer/screens/sign_in_screen/sign_in_screen.dart';
import 'package:lebech_property/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/common_ui/screens/select_application_type_screen/select_application_type_screen.dart';
import 'package:lebech_property/seller/screens/seller_home_screen/seller_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserDetails.userLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userToken = prefs.getString(sharedPreferenceData.userTokenKey) ?? "";
    UserDetails.userCity = prefs.getString(sharedPreferenceData.currentCityKey) ?? "";

    // log("userLoggedIn ::: ${UserDetails.userLoggedIn}");
    // log("userToken ::: ${UserDetails.userToken}");
    // log("userCity ::: ${UserDetails.userCity}");

    UserDetails.applicationType = prefs.getString(sharedPreferenceData.applicationTypeKey) ?? "";

    if(UserDetails.applicationType == "buyer") {
      Get.offAll(()=> HomeScreen());
    }
    else if(UserDetails.applicationType == "seller") {
      if(UserDetails.userLoggedIn == true) {
        Get.offAll(()=> SellerHomeScreen());
      } else {
        Get.offAll(()=> SignInScreen());
      }
    }
    else if(UserDetails.applicationType == "broker") {
      if(UserDetails.userLoggedIn == true) {
        Get.offAll(()=> BrokerHomeScreen());
      } else {
        Get.offAll(()=> SignInScreen());
      }
    }
    else if(UserDetails.applicationType == "builder") {
      if(UserDetails.userLoggedIn == true) {
        Get.offAll(()=> BuilderHomeScreen());
      } else {
        Get.offAll(()=> SignInScreen());
      }
    } else {
      Get.offAll(()=> SelectApplicationTypeScreen(), transition: Transition.zoom);
    }


  }

  @override
  void onInit() {
    goToNextScreen();
    super.onInit();
  }

}