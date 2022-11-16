import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/project_list_model/project_list_model.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;



class ProjectListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Datum> projectLists = [];


  Future<void> getProjectListFunction() async {
    isLoading(true);
    String url = ApiUrl.projectListApi;
    log("URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['city'] = "1";

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((value) async {
        ProjectListModel projectListModel = ProjectListModel.fromJson(json.decode(value));
        isSuccessStatus = projectListModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          projectLists.addAll(projectListModel.data.data);
          log("projectLists : $projectLists");

          isLoading(true);
          isLoading(false);
        } else {
          log("getProjectListFunction Else Else");
        }
        
      });

    } catch(e) {
      log("getProjectListFunction Error : $e");
    } /*finally {
      isLoading(false);
    }*/


    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    getProjectFunction();
    super.onInit();
  }

  Future<void> getProjectFunction() async {
    await getProjectListFunction();
  }

}