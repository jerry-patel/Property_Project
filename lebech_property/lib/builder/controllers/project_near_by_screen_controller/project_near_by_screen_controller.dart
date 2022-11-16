import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/project_near_by_screen_models/near_by_item_model.dart';
import 'package:lebech_property/builder/models/project_near_by_screen_models/project_near_by_model.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/add_project_price_range_model.dart';
import 'package:lebech_property/builder/screens/project_near_by_screen/project_near_by_screen_widgets.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';

class ProjectNearByScreenController extends GetxController {
  int propertyId = Get.arguments[0];
  String title = Get.arguments[1];


  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();


  List<NearByDatum> nearByApiList = [];

  List<AddNearBySingleModule> nearByList = [];

  List<TextEditingController> nearByTextControllerList = [];
  List<TextEditingController> nearByTravelTimeControllerList = [];
  List<List<bool>> nearByStatusMainList = [];
  List<bool> nearByStatusList = [];

  TextEditingController nearByTextController1 = TextEditingController();
  TextEditingController nearByTravelTimeController1 = TextEditingController();
  List<bool> nearByStatusList1 = [true, false];


  // Get Price Range
  Future<void> getProjectNearByFunction() async {
    isLoading(true);
    String url = ApiUrl.getProjectNearByApi;
    log("Project Price Range Api Url : $url");

    try {

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['project_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectNearByModel projectPriceRangeModel = ProjectNearByModel.fromJson(json.decode(value));
        isSuccessStatus = projectPriceRangeModel.status.obs;
        log("isSuccessStatus 111 : ${isSuccessStatus.value}");

        if(isSuccessStatus.value) {
          nearByApiList.clear();
          nearByApiList.addAll(projectPriceRangeModel.data.data);
          log("priceRangeApiList Length : ${nearByApiList.length}");

        } else {
          log("getProjectPriceRangeFunction Else Else");
        }
      });

    } catch(e) {
      log("getProjectPriceRangeFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Add Price Range
  Future<void> addPriceRangeFunction() async {
    isLoading(true);
    String url = ApiUrl.addProjectNearByApi;
    log("Add Price range api url : $url");

    try {
      // Map<String, String> sellerHeader = <String,String> {
      //   'Authorization': "Bearer ${UserDetails.userToken}"
      // };

      List<NearByItemModel> priceData = [];
      for(int i = 0; i < nearByList.length; i++) {
        priceData.add(
            NearByItemModel(
             name: nearByList[i].nearByController.text,
              time: nearByList[i].nearByTravelTimeController.text,
              active: nearByList[i].nearByStatus
            )
        );
      }


      Map<String, Map<String, dynamic>> finalMap = {};

      for(int i=0; i< priceData.length; i++) {
        finalMap.addAll({
          "$i" : {
            "name" : priceData[i].name,
            "time" : priceData[i].time,
            "active" : priceData[i].active
          }
        });
      }

      Map<String, dynamic> bodyData = {
        'project_id' : propertyId.toString(),
        'near' : finalMap
      };

      log("bodyData : ${jsonEncode(bodyData)}");


      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.sellerHeader,
        body: jsonEncode(bodyData),
      );

      log("Response : ${response.body}");

      AddProjectPriceRangeModel addProjectPriceRangeModel = AddProjectPriceRangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = addProjectPriceRangeModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addProjectPriceRangeModel.data.msg);
        // await getProjectNearByFunction();
        Get.back();
      } else {
        log("addPriceRangeFunction Else Else");
      }

    } catch(e) {
      log("addPriceRangeFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getProjectNearByFunction();

    nearByTextControllerList = [nearByTextController1];
    nearByTravelTimeControllerList = [nearByTravelTimeController1];
    nearByStatusMainList = [nearByStatusList1];
    nearByStatusList = [false];


    nearByList.add(
        AddNearBySingleModule(
          nearByController: nearByTextControllerList[0],
          nearByTravelTimeController: nearByTravelTimeControllerList[0],
          nearByStatusList: nearByStatusMainList[0],
          nearByStatus: nearByStatusList[0],
          index: 0,
        )
    );

    super.onInit();
  }

}