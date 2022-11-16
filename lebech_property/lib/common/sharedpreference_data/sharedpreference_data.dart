import 'dart:developer';

import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = 'isUserLoggedInKey';
  String userTokenKey = 'userTokenKey';
  String currentCityKey = "currentCityKey";
  String applicationTypeKey = 'applicationTypeKey';

  Future<void> setUserLoggedInDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userTokenKey, userToken);

    log('isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    log('userTokenKey : ${prefs.getString(userTokenKey)}');

    UserDetails.userLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";
    UserDetails.userCity = prefs.getString(currentCityKey) ?? "";
  }

  Future<void> setCurrentCityInPrefs({required String cityId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentCityKey, cityId);
    log("currentCityKey : ${prefs.getString(currentCityKey)}");
  }

  Future<void> setApplicationType({required String applicationType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(applicationTypeKey, applicationType);
    UserDetails.applicationType = prefs.getString(applicationTypeKey) ?? "";
    log("Application Type : ${prefs.getString(applicationTypeKey)}");
  }

  Future<String> getApplicationType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String applicationType = prefs.getString(applicationTypeKey) ?? "";
    return applicationType;
  }

  Future<void> removeApplicationType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(applicationTypeKey);
  }

}