import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_home_screen_models/project_list_model.dart';
import 'package:lebech_property/builder/models/builder_home_screen_models/project_status_change_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';

class BuilderHomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<BuilderProjectDatum> builderProjectList = [];




  /// Get Builder All Projects
  Future<void> getBuilderAllProjectFunction() async {
    isLoading(true);
    String url = ApiUrl.getBuilderAllProjectsApi;
    log("Get All Projects Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader);
      log("response : ${response.body}");

      BuilderProjectListModel builderProjectListModel = BuilderProjectListModel.fromJson(json.decode(response.body));
      isSuccessStatus = builderProjectListModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        builderProjectList.clear();
        builderProjectList.addAll(builderProjectListModel.data.data);
        log("builderProjectList : ${builderProjectList.length}");
      } else {
        log("Get All Project Else Else");
      }

    } catch(e) {
      log("Get All Project Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> changeProjectStatus(int projectId, bool status) async {
    String url = ApiUrl.changeProjectStatusApi;
    log("Change Project Status : $url");

    try {
      Map<String, dynamic> data = {
        "project_id" : "$projectId",
        "status" : "$status"
      };
      log("data : $data");

      Map<String, String> header = <String,String> {
        'Authorization': "Bearer ${UserDetails.userToken}"
      };

      http.Response response = await http.post(
          Uri.parse(url),
          body: data,
        headers: header,
      );
      log("Change Status Response Body : ${response.body}");

      ProjectStatusChangeModel projectStatusChangeModel = ProjectStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = projectStatusChangeModel.status.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: projectStatusChangeModel.data.msg);
        await getBuilderAllProjectFunction();
      } else {
        log("Change Project Status Else");
      }


    } catch(e) {
      log("Change Project Status Error ::: $e");
    } finally {
      // isLoading(false);
      await getBuilderAllProjectFunction();
    }
  }

  @override
  void onInit() {
    getBuilderAllProjectFunction();
    super.onInit();
  }


}