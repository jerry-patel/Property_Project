import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lebech_property/builder/models/add_other_project_screen_model/add_other_project_model.dart';
import 'package:lebech_property/builder/models/add_other_project_screen_model/get_other_project_list_model.dart';
import 'package:lebech_property/builder/models/add_other_project_screen_model/other_project_delete_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';

class AddOtherProjectScreenController extends GetxController {
  int id = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController projectNameFieldController = TextEditingController();
  TextEditingController projectAddressFieldController = TextEditingController();
  XFile selectedFile = XFile("");


  List<OtherProjectData> otherProjectsList = [];

  //Add Other Project
  Future<void> addOtherProjectFunction() async {
    isLoading(true);
    String url = ApiUrl.addOtherProjectApi;
    log("Add Other Project Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      var stream = http.ByteStream(selectedFile.openRead());
      stream.cast();

      var length = await selectedFile.length();

      request.files.add(await http.MultipartFile.fromPath("image", selectedFile.path));

      var multiPart = http.MultipartFile('Image', stream, length);
      request.files.add(multiPart);

      request.fields['project_id'] = "$id";
      request.fields['name'] = projectNameFieldController.text.trim();
      request.fields['address'] = projectAddressFieldController.text.trim();

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async{
        AddOtherProjectModel addOtherProjectModel = AddOtherProjectModel.fromJson(json.decode(value));
        isSuccessStatus = addOtherProjectModel.status.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addOtherProjectModel.data.msg);
          projectNameFieldController.clear();
          projectAddressFieldController.clear();
          selectedFile = XFile("");
          await getOtherProjectListFunction();
        } else {
          log("Add Other Project Function Else");
        }
      });

    } catch (e) {
      log("Add Other Project Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Get Other Project List
  Future<void> getOtherProjectListFunction() async {
    isLoading(true);
    String url = ApiUrl.getBuilderOtherProjectImageApi;
    log("Get Builder Other Project List Api Url : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$id"
      };

      Map<String, String> sellerHeader = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };
      log("sellerHeader : $sellerHeader");

      http.Response response = await http.post(
          Uri.parse(url),
          headers: sellerHeader,
          body: data);
      log("response : ${response.body}");

      GetOtherProjectListModel getOtherProjectListModel = GetOtherProjectListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getOtherProjectListModel.status.obs;

      if(isSuccessStatus.value) {
        otherProjectsList.clear();
        otherProjectsList.addAll(getOtherProjectListModel.data.data);
      } else {
        log("getOtherProjectListFunction Else");
      }

    } catch(e) {
      log("getOtherProjectListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete Other Project
  Future<void> deleteOtherProjectFunction(int id) async {
    isLoading(true);
    String url = ApiUrl.deleteBuilderOtherProjectApi;
    log("Delete Builder Other Project Api Url : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.sellerHeader);

      request.fields['id'] = "$id";

      var response = await request.send();


      response.stream.transform(utf8.decoder).listen((value) async {

        DeleteOtherProjectListModel deleteOtherProjectListModel = DeleteOtherProjectListModel.fromJson(json.decode(value));
        isSuccessStatus = deleteOtherProjectListModel.status.obs;
        log('isSuccessStatus : ${isSuccessStatus.value}');

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: deleteOtherProjectListModel.data.msg);
          await getOtherProjectListFunction();
        } else {
          log('addPropertyImagesFunction Else');
        }
      });



    } catch(e) {
      log("deleteOtherProjectFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getOtherProjectListFunction();
    super.onInit();
  }

}
