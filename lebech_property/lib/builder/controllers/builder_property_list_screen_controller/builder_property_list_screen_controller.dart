import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:lebech_property/builder/models/builder_home_screen_models/project_status_change_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:lebech_property/common/user_details/user_details.dart';
import 'package:lebech_property/seller/models/seller_home_screen_models/property_list_model.dart';

class BuilderPropertyListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<SellerPropertyDatum> builderPropertyList = [];

  /// Get Builder All Property
  Future<void> getBuilderAllPropertyFunction() async {
    isLoading(true);
    String url = ApiUrl.getBuilderAllPropertyApi;
    log("Get All Property Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.sellerHeader);
      // log("response : ${response.body}");

      PropertyListModule propertyListModule = PropertyListModule.fromJson(json.decode(response.body));
      isSuccessStatus = propertyListModule.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        builderPropertyList.clear();
        builderPropertyList.addAll(propertyListModule.data.data);
        log("brokerPropertyList : ${builderPropertyList.length}");
      } else {
        log("Get All Property Else Else");
      }

    } catch(e) {
      log("Get All Property Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> changePropertyStatus(int projectId, bool status) async {
    String url = ApiUrl.changePropertyStatusApi;
    log("Change Property Status : $url");

    try {
      Map<String, dynamic> data = {
        "id" : "$projectId",
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

      } else {
        log("Change Project Status Else");
      }


    } catch(e) {
      log("Change Project Status Error ::: $e");
    } finally {
      // isLoading(false);
      await getBuilderAllPropertyFunction();
    }
  }


  @override
  void onInit() {
    getBuilderAllPropertyFunction();
    super.onInit();
  }

}