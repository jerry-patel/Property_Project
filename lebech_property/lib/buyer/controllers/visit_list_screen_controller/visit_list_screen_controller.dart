import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lebech_property/buyer/models/visit_list_screen_model/visit_list_model.dart';
import 'package:lebech_property/common/constants/api_header.dart';
import 'package:lebech_property/common/constants/api_url.dart';
import 'package:http/http.dart' as http;


class VisitListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  List<VisitDatum> visitList = [];


  /// Get Booked Visit List
  Future getBookedVisitListFunction() async {
    isLoading(true);
    log("isLoading : $isLoading");
    String url = ApiUrl.visitListApi;
    log("Visit List API URL : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log('response: ${response.body}');

      VisitListModel visitListModel = VisitListModel.fromJson(json.decode(response.body));
      isSuccessStatus = visitListModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        visitList.clear();
        // visitList.addAll(visitListModel.data.data);
        visitList = visitListModel.data.data;
        log("visitList : $visitList");
      } else {
        log("getBookedVisitsFunction Else Else");
      }

      /*var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      var response = await request.send();

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) async {
        VisitListModel visitListModel = VisitListModel.fromJson(json.decode(dataLine));
        isSuccessStatus = visitListModel.status.obs;
        log("isSuccessStatus : $isSuccessStatus");

        if(isSuccessStatus.value) {
          visitList.clear();
          // visitList.addAll(visitListModel.data.data);
          visitList = visitListModel.data.data;
          log("visitList : $visitList");
        } else {
          log("getBookedVisitsFunction Else Else");
        }
      });*/
    } catch(e) {
      log("getBookedVisitsFunction Error ::: $e");
    } finally {
      isLoading(false);
      log("isLoading : $isLoading");
      // loadUI();
      // loadUI();
      // loadUI();
    }


  }


  @override
  void onInit() {
    log("onInit Called");
    getBookedVisitListFunction();
    super.onInit();
  }

  loadUI() {
    log("LoadUI");
    isLoading(true);
    isLoading(false);
  }
}