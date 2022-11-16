import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/delete_property_link_model.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/get_property_video_link_model.dart';
import 'package:lebech_property/builder/models/builder_property_yt_link_screen_models/upload_yt_link_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';

class BuilderPropertyYoutubeLinkScreenController extends GetxController {
  int propertyId = Get.arguments[0];
  String title = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  TextEditingController ytLinkController = TextEditingController();
  List<YtLinkDatum> propertyYtLinkList = [];


  // Upload Yt Link
  Future<void> uploadYoutubeLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.addPropertyYoutubeLinkApi;
    log("Upload Youtube Link Api Url : $url");

    try {
      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(sellerHeader);

      request.fields['property_id'] = "$propertyId";
      request.fields['link'] = ytLinkController.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        UploadPropertyYtLinkModel uploadPropertyYtLinkModel = UploadPropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = uploadPropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: uploadPropertyYtLinkModel.data.msg);
          ytLinkController.clear();
          await getPropertyYoutubeLinkFunction();
        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });

    } catch(e) {
      log("uploadYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  // Get Yt Link
  Future<void> getPropertyYoutubeLinkFunction() async {
    isLoading(true);
    String url = ApiUrl.getPropertyYoutubeLinkApi;
    log("Get Property Yt Link Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$propertyId";
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        GetPropertyYtLinkModel getPropertyYtLinkModel = GetPropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = getPropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          propertyYtLinkList.clear();
          propertyYtLinkList.addAll(getPropertyYtLinkModel.data.data);
          log("propertyYtLinkList Length : ${propertyYtLinkList.length}");

        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });

    } catch(e) {
      log("getPropertyYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete Yt Link
  Future<void> deletePropertyYoutubeLinkFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.deletePropertyYoutubeLinkApi;
    log("Delete Property Yt Link Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['property_id'] = "$propertyId";
      request.fields['id'] = "$id";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        DeletePropertyYtLinkModel deletePropertyYtLinkModel = DeletePropertyYtLinkModel.fromJson(json.decode(value));
        isSuccessStatus = deletePropertyYtLinkModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deletePropertyYtLinkModel.data.msg);
          await getPropertyYoutubeLinkFunction();
        } else {
          log("uploadYoutubeLinkFunction Else Else");
        }
      });


    } catch(e) {
      log("deletePropertyYoutubeLinkFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getPropertyYoutubeLinkFunction();
    super.onInit();
  }

}