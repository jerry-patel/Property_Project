import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/add_project_price_range_model.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/project_price_range_model.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/single_item_model.dart';
import 'package:lebech_property/builder/screens/project_price_range_screen/project_price_range_screen_widgets.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;



class ProjectPriceRangeScreenController extends GetxController {
  int propertyId = Get.arguments[0];
  String title = Get.arguments[1];


  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<PriceRangeSingleItemModule> priceRangeList = [];

  List<ProjectPriceRangeDatum> priceRangeApiList = [];

  List<TextEditingController> priceRangeTypeTeControllerList = [];
  List<TextEditingController> priceRangeSellPriceControllerList = [];
  List<TextEditingController> priceRangeAreaControllerList = [];
  List<List<bool>> priceRangeStatusMainList = [];
  List<bool> priceRangeStatusList = [];

  TextEditingController priceRangeTypeController1 = TextEditingController();
  TextEditingController priceRangeSellPriceController1 = TextEditingController();
  TextEditingController priceRangeAreaController1 = TextEditingController();
  List<bool> priceRangeStatusList1 = [true, false];
  // bool priceRangeStatus = false;



  // Get Price Range
  Future<void> getProjectPriceRangeFunction() async {
    isLoading(true);
    String url = ApiUrl.getProjectPriceRangeApi;
    log("Project Price Range Api Url : $url");

    try {

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['project_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectPriceRangeModel projectPriceRangeModel = ProjectPriceRangeModel.fromJson(json.decode(value));
        isSuccessStatus = projectPriceRangeModel.status.obs;
        log("isSuccessStatus 111 : ${isSuccessStatus.value}");

        if(isSuccessStatus.value) {
          priceRangeApiList.clear();
          priceRangeApiList.addAll(projectPriceRangeModel.data.data);
          log("priceRangeApiList Length : ${priceRangeApiList.length}");

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
    String url = ApiUrl.addProjectPriceRangeApi;
    log("Add Price range api url : $url");

    try {
      // Map<String, String> sellerHeader = <String,String> {
      //   'Authorization': "Bearer ${UserDetails.userToken}"
      // };

      List<SingleItemModel> priceData = [];
      for(int i = 0; i < priceRangeList.length; i++) {
        priceData.add(
            SingleItemModel(
              type: priceRangeList[i].priceRangeTypeController.text,
              price: priceRangeList[i].priceRangeSellPriceController.text,
              area: priceRangeList[i].priceRangeAreaController.text,
              active: priceRangeList[i].priceRangeStatus,
            )
        );
      }


      Map<String, Map<String, dynamic>> finalMap = {};

      for(int i=0; i< priceData.length; i++) {
        finalMap.addAll({
          "$i" : {
            "type" : priceData[i].type,
            "price" : priceData[i].price,
            "area" : priceData[i].area,
            "active" : priceData[i].active
          }
        });
      }

      Map<String, dynamic> bodyData = {
        'project_id' : propertyId.toString(),
        'prices' : finalMap
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
        // await getProjectPriceRangeFunction();
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
    log("propertyId : $propertyId");
    getProjectPriceRangeFunction();

    priceRangeTypeTeControllerList = [priceRangeTypeController1];
    priceRangeSellPriceControllerList = [priceRangeSellPriceController1];
    priceRangeAreaControllerList = [priceRangeAreaController1];
    priceRangeStatusMainList = [priceRangeStatusList1];
    priceRangeStatusList = [false];


    priceRangeList = [
      PriceRangeSingleItemModule(
        priceRangeTypeController: priceRangeTypeTeControllerList[0],
        priceRangeSellPriceController: priceRangeSellPriceControllerList[0],
        priceRangeAreaController: priceRangeAreaControllerList[0],
        priceRangeStatusList: priceRangeStatusMainList[0],
        priceRangeStatus: priceRangeStatusList[0],
        index: 0,
      )
    ];
    super.onInit();
  }

}