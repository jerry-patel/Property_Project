import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/buyer/models/category_wise_property_model/category_wise_property_model.dart';
import 'package:lebech_property/buyer/models/home_screen_model/home_screen_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';

class CategoryPropertyScreenController extends GetxController {
  /// From Drawer Menu
  List<HomePropertyType> subCategoryList = Get.arguments;
  HomePropertyType? subCategoryValue;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<CategoryWiseDatum> categoryPropertyList = [];

  RxString propertyTypeValue = 'Rent'.obs;



  getCategoryWisePropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryWisePropertyApi;
    log("Category Wise Property URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['id'] = "${subCategoryValue!.id}";
      request.fields['status'] = propertyTypeValue.value.toLowerCase();
      request.fields['city'] = "1";
      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) async {
        CategoryPropertyModel categoryPropertyModel = CategoryPropertyModel.fromJson(json.decode(dataLine));
        isSuccessStatus = categoryPropertyModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if (isSuccessStatus.value) {
          categoryPropertyList.clear();
          categoryPropertyList.addAll(categoryPropertyModel.data.data);
          log("categoryPropertyList : ${categoryPropertyList.length}");
          // isLoading(false);
          isLoading(true);
          isLoading(false);

        } else {
          log("getCategoryWisePropertyFunction Else Else");
        }

      });

    } catch (e) {
      log("getCategoryWisePropertyFunction Error :: $e");
    } /*finally {
      isLoading(false);
    }*/
    loadUI();
  }



  @override
  void onInit() {
    subCategoryValue = subCategoryList[0];
    getCategoryWisePropertyFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}