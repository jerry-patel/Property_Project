import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebech_property/buyer/models/sub_category_wise_property_model/sub_category_wise_property_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';

class SubCategoryWisePropertyScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<Datum> subCategoryWisePropertyList = [];
  RxString propertyTypeValue = 'Rent'.obs;


  subCategoryWisePropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getSubCategoryWisePropertyApi;
    log("Sub Category Wise Property API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields["id"] = "6";
      request.fields["status"] = propertyTypeValue.value.toLowerCase();
      request.fields["city"] = "1";
      log("Fields ::: ${request.fields}");

      var response = await request.send();

      response.stream.transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((dataLine) {
        SubCategoryWisePropertyModel subCategoryWisePropertyModel = SubCategoryWisePropertyModel.fromJson(json.decode(dataLine));
        isSuccessStatus = subCategoryWisePropertyModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          subCategoryWisePropertyList = subCategoryWisePropertyModel.data.data;
          log("subCategoryWisePropertyList Length : ${subCategoryWisePropertyModel.data.data.length}");
          loadUI();
        } else {
          log("subCategoryWisePropertyFunction Else Else");
        }

      });

    } catch(e) {
      log("subCategoryWisePropertyFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    subCategoryWisePropertyFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}