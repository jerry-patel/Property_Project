import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/project_price_range_screen_models/add_project_price_range_model.dart';
import 'package:lebech_property/builder/models/project_yt_link_screen_model/project_yt_link_model.dart';
// import 'package:lebech_property/builder/models/project_yt_link_screen_model/project_yt_link_model.dart';
import 'package:lebech_property/builder/models/project_yt_link_screen_model/yt_link_item_model.dart';
import 'package:lebech_property/builder/screens/project_yt_link_screen/project_yt_link_screen_widgets.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';

class ProjectYtLinkScreenController extends GetxController {
  int propertyId = Get.arguments[0];
  String title = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<YtLinkDatum> ytLinkApiList = [];

  List<YouTubeVideoLinkModule> ytLinkList = [];

  List<TextEditingController> ytLinkTextControllerList = [];
  List<List<bool>> ytLinkStatusMainList = [];
  List<bool> ytLinkStatusList = [];

  TextEditingController ytLinkController1 = TextEditingController();
  List<bool> ytLinkStatusList1 = [true, false];



  // Get Yt Link
  Future<void> getProjectYtLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.getProjectYtLinkApi;
    log("Project Price Range Api Url : $url");

    try {

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['project_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        ProjectYtLinkModel projectPriceRangeModel = ProjectYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = projectPriceRangeModel.status.obs;
        log("isSuccessStatus 111 : ${isSuccessStatus.value}");

        if(isSuccessStatus.value) {
          ytLinkApiList.clear();
          ytLinkApiList.addAll(projectPriceRangeModel.data.data);
          log("priceRangeApiList Length : ${ytLinkApiList.length}");

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


  // Add Yt Link
  Future<void> addProjectYtLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.addProjectYtLinkApi;
    log("Add Project Yt Link api url : $url");

    try {
      // Map<String, String> sellerHeader = <String,String> {
      //   'Authorization': "Bearer ${UserDetails.userToken}"
      // };

      List<YtLinkItemModel> priceData = [];
      for(int i = 0; i < ytLinkList.length; i++) {
        priceData.add(
            YtLinkItemModel(
                link: ytLinkList[i].ytLinkController.text
            )
        );
      }


      Map<String, Map<String, dynamic>> finalMap = {};

      for(int i=0; i< priceData.length; i++) {
        finalMap.addAll({
          "$i" : {
            "link" : priceData[i].link
          }
        });
      }

      Map<String, dynamic> bodyData = {
        'project_id' : propertyId.toString(),
        'video' : finalMap
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
        // await getProjectYtLinkFunction();
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
    getProjectYtLinkFunction();

    ytLinkTextControllerList = [ytLinkController1];
    ytLinkStatusMainList = [ytLinkStatusList1];
    ytLinkStatusList = [false];

    ytLinkList.add(
        YouTubeVideoLinkModule(
          ytLinkController: ytLinkTextControllerList[0],
          ytLinkStatusList: ytLinkStatusMainList[0],
          ytLinkStatus: ytLinkStatusList[0],
          index: 0,
        ),
    );

    super.onInit();
  }


}